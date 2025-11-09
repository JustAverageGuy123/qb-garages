let allVehicles = [];
let currentGarageLabel = "";

window.addEventListener("message", function (event) {
    const data = event.data;
    if (data.action === "VehicleList") {
        currentGarageLabel = data.garageLabel || "Garage";
        allVehicles = data.vehicles;
        populateVehicleList(currentGarageLabel, allVehicles);
        displayUI();
    }
});

document.addEventListener("keydown", function (event) {
    if (event.key === "Escape") {
        closeGarageMenu();
    }
});

/* Click anywhere on vehicle row to expand */
document.addEventListener("click", function (e) {
    const vehicleItem = e.target.closest(".vehicle-item");
    if (!vehicleItem) return;
    if (e.target.closest(".expand-btn, .drive-btn, .transfer-btn")) return;

    const expandBtn = vehicleItem.querySelector(".expand-btn");
    if (expandBtn) {
        toggleVehicleExpand(vehicleItem, expandBtn);
    }
});

/* Search & close */
document.addEventListener("DOMContentLoaded", function () {
    const searchInput = document.querySelector(".search-input");
    if (searchInput) {
        searchInput.addEventListener("input", function (e) {
            const searchTerm = e.target.value.toLowerCase();
            filterVehicles(searchTerm);
        });
    }

    const closeBtn = document.querySelector(".garage-logo");
    if (closeBtn) {
        closeBtn.addEventListener("click", closeGarageMenu);
    }
});

function filterVehicles(searchTerm) {
    const filteredVehicles = allVehicles.filter((v) => {
        return (
            v.vehicleLabel.toLowerCase().includes(searchTerm) ||
            v.plate.toLowerCase().includes(searchTerm)
        );
    });
    populateVehicleList(currentGarageLabel, filteredVehicles);
}

function closeGarageMenu() {
    const container = document.querySelector(".container");
    container.style.display = "none";

    const searchInput = document.querySelector(".search-input");
    if (searchInput) searchInput.value = "";

    fetch("https://qb-garages/closeGarage", {
        method: "POST",
        headers: { "Content-Type": "application/json; charset=UTF-8" },
        body: JSON.stringify({}),
    })
    .then(r => r.json())
    .then(data => { if (data !== "ok") console.error("Failed to close Garage UI"); });
}

function displayUI() {
    document.querySelector(".container").style.display = "block";
}

// HELPER: Format large numbers (e.g., 1200 → 1.2k)
function formatDistance(dist) {
    if (dist >= 1000) {
        return (dist / 1000).toFixed(1) + 'k';
    }
    return Math.round(dist).toString();
}

function populateVehicleList(garageLabel, vehicles) {
    const vehicleContainerElem = document.querySelector(".vehicle-table");
    const fragment = document.createDocumentFragment();

    while (vehicleContainerElem.firstChild) {
        vehicleContainerElem.removeChild(vehicleContainerElem.firstChild);
    }

    // Update header
    const header = document.getElementById("garage-title");
    if (header) {
        header.textContent = garageLabel;
    }

    const vehicleCount = document.querySelector(".vehicle-count");
    if (vehicleCount) {
        vehicleCount.textContent = `${vehicles.length} vehicle${vehicles.length !== 1 ? "s" : ""}`;
    }

    vehicles.forEach((v, index) => {
        const vehicleItem = document.createElement("div");
        vehicleItem.classList.add("vehicle-item");
        vehicleItem.dataset.index = index;

        /* ----- Thumbnail ----- */
        const thumbnail = document.createElement("div");
        thumbnail.classList.add("vehicle-thumbnail");

        const img = document.createElement("img");
        img.src = v.image || "";
        img.alt = v.vehicleLabel || "Vehicle";
        img.classList.add("thumbnail-img");
        img.onerror = function() {
            this.style.display = "none";
            thumbnail.style.backgroundColor = getVehicleColor(v);
        };
        thumbnail.appendChild(img);

        /* ----- Vehicle Info ----- */
        const vehicleInfo = document.createElement("div");
        vehicleInfo.classList.add("vehicle-info");
        vehicleInfo.appendChild(thumbnail);

        const vehicleDetails = document.createElement("div");
        vehicleDetails.classList.add("vehicle-details");

        const vehicleName = document.createElement("div");
        vehicleName.classList.add("vehicle-name");
        vehicleName.textContent = v.vehicleLabel;
        vehicleDetails.appendChild(vehicleName);

        const vehicleMeta = document.createElement("div");
        vehicleMeta.classList.add("vehicle-meta");

        const plate = document.createElement("span");
        plate.classList.add("plate");
        plate.textContent = v.plate;
        vehicleMeta.appendChild(plate);

        // MILEAGE: Now uses v.distance + v.distanceUnit from Lua
        const mileage = document.createElement("span");
        mileage.classList.add("mileage");
        mileage.textContent = `${formatDistance(v.distance)} ${v.distanceUnit}`;
        vehicleMeta.appendChild(mileage);

        vehicleDetails.appendChild(vehicleMeta);
        vehicleInfo.appendChild(vehicleDetails);

        const vehicleActions = document.createElement("div");
        vehicleActions.classList.add("vehicle-actions");

        // Badge: Real garage name
        const badge = document.createElement("span");
        badge.classList.add("vehicle-badge");
        badge.textContent = garageLabel;
        vehicleActions.appendChild(badge);

        // Expand Button
        const expandBtn = document.createElement("button");
        expandBtn.classList.add("expand-btn");
        const chevron = document.createElement("i");
        chevron.classList.add("fas", "fa-chevron-down");
        expandBtn.appendChild(chevron);
        expandBtn.onclick = e => {
            e.stopPropagation();
            toggleVehicleExpand(vehicleItem, expandBtn);
        };
        vehicleActions.appendChild(expandBtn);

        vehicleInfo.appendChild(vehicleActions);
        vehicleItem.appendChild(vehicleInfo);

        const stats = document.createElement("div");
        stats.classList.add("stats");

        const maxValues = { fuel: 100, engine: 1000, body: 1000 };
        ["fuel", "engine", "body"].forEach(statLabel => {
            const stat = document.createElement("div");
            stat.classList.add("stat");

            const label = document.createElement("div");
            label.classList.add("label");
            label.textContent = statLabel.charAt(0).toUpperCase() + statLabel.slice(1);
            stat.appendChild(label);

            const progressBar = document.createElement("div");
            progressBar.classList.add("progress-bar");

            const progress = document.createElement("span");
            const progressText = document.createElement("span");
            progressText.classList.add("progress-text");

            const percentage = (v[statLabel] / maxValues[statLabel]) * 100;
            progress.style.width = percentage + "%";
            progressText.textContent = Math.round(percentage) + "%";

            if (percentage >= 75) progress.classList.add("bar-green");
            else if (percentage >= 50) progress.classList.add("bar-yellow");
            else progress.classList.add("bar-red");

            progressBar.appendChild(progressText);
            progressBar.appendChild(progress);
            stat.appendChild(progressBar);
            stats.appendChild(stat);
        });

        const financeDriveContainer = document.createElement("div");
        financeDriveContainer.classList.add("finance-drive-container");

        const financeInfo = document.createElement("div");
        financeInfo.classList.add("finance-info");
        financeInfo.textContent = v.balance > 0 ? `Balance: $${v.balance}` : "Paid Off";
        financeDriveContainer.appendChild(financeInfo);

        let status, isDepotPrice = false, isDisabled = false;

        if (v.state === 0) {
            if (v.depotPrice && v.depotPrice > 0) {
                isDepotPrice = true;
                if (v.type === "public") { status = "Depot"; isDisabled = true; }
                else if (v.type === "depot") status = `$${v.depotPrice}`;
                else status = "Out";
            } else status = "Out";
        } else if (v.state === 1) {
            if (v.depotPrice && v.depotPrice > 0) {
                isDepotPrice = true;
                if (v.type === "depot") status = `$${v.depotPrice}`;
                else if (v.type === "public") { status = "Depot"; isDisabled = true; }
                else status = "Drive";
            } else status = "Drive";
        } else if (v.state === 2) {
            status = "Impound";
            isDisabled = true;
        }

        const driveButton = document.createElement("button");
        driveButton.classList.add("drive-btn");
        driveButton.textContent = status;
        if (isDisabled) driveButton.disabled = true;

        driveButton.onclick = e => {
            e.stopPropagation();
            if (driveButton.disabled) return;

            const vehicleStats = { fuel: v.fuel, engine: v.engine, body: v.body };
            const vehicleData = {
                vehicle: v.vehicle, garage: v.garage, index: v.index,
                plate: v.plate, type: v.type, depotPrice: v.depotPrice,
                stats: vehicleStats
            };

            if (status === "Out") {
                fetch("https://qb-garages/trackVehicle", {
                    method: "POST",
                    headers: { "Content-Type": "application/json; charset=UTF-8" },
                    body: JSON.stringify(v.plate)
                }).then(r => r.json()).then(d => { if (d === "ok") closeGarageMenu(); });
            } else if (isDepotPrice) {
                fetch("https://qb-garages/takeOutDepo", {
                    method: "POST",
                    headers: { "Content-Type": "application/json; charset=UTF-8" },
                    body: JSON.stringify(vehicleData)
                }).then(r => r.json()).then(d => { if (d === "ok") closeGarageMenu(); });
            } else {
                fetch("https://qb-garages/takeOutVehicle", {
                    method: "POST",
                    headers: { "Content-Type": "application/json; charset=UTF-8" },
                    body: JSON.stringify(vehicleData)
                }).then(r => r.json()).then(d => { if (d === "ok") closeGarageMenu(); });
            }
        };
        financeDriveContainer.appendChild(driveButton);

        if (v.balance && v.balance > 0) {
            const transferButton = document.createElement("button");
            transferButton.classList.add("transfer-btn");
            transferButton.textContent = "Transfer";
            transferButton.onclick = e => { e.stopPropagation(); console.log("Transfer:", v.plate); };
            financeDriveContainer.appendChild(transferButton);
        }

        stats.appendChild(financeDriveContainer);
        vehicleItem.appendChild(stats);
        fragment.appendChild(vehicleItem);
    });

    vehicleContainerElem.appendChild(fragment);
}

// Optional: Fallback color
function getVehicleColor(vehicle) {
    switch (vehicle.type) {
        case "car": return "#1e90ff";
        case "boat": return "#4dd0e1";
        case "air": return "#ffa726";
        default: return "#666666";
    }
}

function toggleVehicleExpand(vehicleItem, expandBtn) {
    const isExpanded = vehicleItem.classList.contains("expanded");
    const icon = expandBtn.querySelector("i");

    document.querySelectorAll(".vehicle-item.expanded").forEach(item => {
        if (item !== vehicleItem) {
            item.classList.remove("expanded");
            const btn = item.querySelector(".expand-btn");
            if (btn) {
                btn.classList.remove("expanded");
                btn.querySelector("i").classList.replace("fa-chevron-up", "fa-chevron-down");
            }
        }
    });

    if (isExpanded) {
        vehicleItem.classList.remove("expanded");
        expandBtn.classList.remove("expanded");
        icon.classList.replace("fa-chevron-up", "fa-chevron-down");
    } else {
        vehicleItem.classList.add("expanded");
        expandBtn.classList.add("expanded");
        icon.classList.replace("fa-chevron-down", "fa-chevron-up");
    }
}