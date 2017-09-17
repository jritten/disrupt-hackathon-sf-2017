$(function() {
    var resolution = Cookies.get("resolution") || "720p",
        maxFrameRate = Number(Cookies.get("maxFrameRate") || 30),
            //maxBitRate        = Number(Cookies.get("maxBitRate") || 750),
        channel = Cookies.get("roomName"),
        remoteStreamList = [],
        client = AgoraRTC.createClient({mode: 'interop'}),
        disableAudio = false,
        disableVideo = false,
        hideLocalStream = false,
        fullscreenEnabled = false,
        uid,
        localStream,
        lastLocalStreamId,
        isMixed = false,
        audioSelect = document.querySelector('select#audioSource'),
        videoSelect = document.querySelector('select#videoSource');

    (function initAgoraRTC() {
        $.get('/app_id', function(appId) {
            client.on('error', function(err) {
            console.log(err);
                if (err.reason === 'INVALID_CHANNEL_NAME') {
                    $.alert("Invalid channel name, Chinese characters are not allowed in channel name.");
                    }
            });

            client.init(appId, function (obj) {
                console.log("AgoraRTC client initialized");

            getDevices();

            client.join(null, channel, undefined, function(uid) {
                    console.log("User " + uid + " join channel successfully");
                    console.log("Timestamp: " + Date.now());
                    localStream = initLocalStream(uid);
                    lastLocalStreamId = localStream.getId();
                    });
                });
            });


}