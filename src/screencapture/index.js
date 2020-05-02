
/**
 * - Firefoxba is menjen
 * - Hanggal tesztelni
 * - nvenc
 */

function createOverlay() {
    var overlay = document.createElement('div');
    overlay.id = 'custom-overlay';
    // language=HTML
    overlay.innerHTML = `
        <style>
            #custom-overlay {
                width: 100%;
                min-width: 150px;
                position: absolute;
                right: 0px;
                top: 0px;
                background: rgba(0.5, 0.5, 0.5, 0.5);
                text-align: right;
            }

            #ovlcontainer > div > .name {
                position: absolute;
                top: -20px;
                color: white;
                font-size: 10px;
            }

            #ovlcontainer > div > video {
                position: absolute;
                width: calc(100%);
                height: calc(100%);
                left: 0px;
                top: 0px;
            }

            #ovlcontainer > div {
                text-align: center;
                border-top: 1px solid white;
                border-bottom: 1px solid white;
                margin-bottom: 1px;
                padding-top: 56.25%;
                position: relative;
                margin-top: 12px;
            }

            #ovlcontainer {
                background: black;
                display: flex;
                flex-direction: column;
            }
        </style>
        <button id="ovltogglesize">SIZE</button>
        <button id="ovltogglemin">MIN</button>
        <div id="ovlcontainer"></div>`;

    document.body.appendChild(overlay);
    document.getElementById('ovltogglemin').onclick = function () {
        container = document.getElementById('ovlcontainer');
        container.style.display = container.style.display === "none" ? "flex" : "none";
    }
    document.getElementById('ovltogglesize').onclick = function () {
        container = document.getElementById('custom-overlay');
        container.style.width = container.style.width === "10%" ? "100%" : "10%";
    }

}

function getCellsWithNames() {
    var cwn = {};
    document.querySelectorAll('video:not(.overlayvideo)').forEach(node => {
        cwn[getNameForVideo(node)] = node
    });
    // console.log(cwn);
    return cwn;
}

function getNameForVideo(videoNode) {
    url = window.location.hostname;
    if (url === "whereby.com") {
        return videoNode
            .closest('div[class^="content-"]')
            .querySelector('[class^="nameBanner-"]')
            .innerText;
    } else if (url === "meet.jit.si") { // Not working yet.
        return videoNode
            .parentNode
            .querySelector('.displayname')
            .innerText;
    } else {
        console.error("Unsupported page: ", url);
    }
}


function getOrderMap() {
    return JSON.parse(localStorage.getItem("orderMap") || "{}");
}

function updateOrder() {
    orderMap = getOrderMap();
    cwn = getCellsWithNames();
    for (var key of Object.keys(cwn)) {
        if (!orderMap.hasOwnProperty(key)) {
            orderMap[key] = { index: Object.keys(orderMap).length };
            console.log("Adding new participant: ", key, "index:", orderMap[key].index);
        }
        orderMap[key].node = cwn[key];
    }
    localStorage.setItem("orderMap", JSON.stringify(orderMap));

    return orderMap;
}


function updateOverlay() {

    orderMap = updateOrder();
    container = document.querySelector('#ovlcontainer');

    elements = container.querySelectorAll('#ovlcontainer > div');
    missing = Object.keys(orderMap).length - elements.length;

    // console.log('Adding ', missing, 'new overlay elements.');
    for (i = 0; i < missing; i++) {
        subDiv = document.createElement('div');
        subDiv.innerHTML = `<video autoplay="true" class="overlayvideo"></video><div class='name'>Teszt</div>`
        container.appendChild(subDiv);
    }

    elements = container.querySelectorAll('#ovlcontainer > div');

    for (var key of Object.keys(orderMap)) {
        now = orderMap[key];


        overlayVideo = elements[now.index].querySelector('video');

        if (!now.node.srcObject || !now.node.srcObject.id) {
            continue;
        }
        //
        storedMsId = overlayVideo.getAttribute('data-ms-id');
        if (storedMsId === now.node.srcObject.id) {
            continue;
        }
        overlayVideo.setAttribute('data-ms-id', now.node.srcObject.id);
        overlayVideo.srcObject = captureStream(now.node);
        elements[now.index].querySelector('.name').innerHTML = key;
    }

}

function captureStream(node) {
    if (node.captureStream) {
        return node.captureStream();
    } else if (node.mozCaptureStream) {
        return node.mozCaptureStream();
    }

    console.error("This is an unsupported browser.");
    return null;
}

createOverlay();


window.setInterval(function () {
    updateOverlay();
}, 1000);
