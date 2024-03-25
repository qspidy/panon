// import QtQuick 2.0
import QtQuick 2.15
import QtWebSockets 1.1
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.plasma5support as Plasma5Support
import "utils.js" as Utils
/*
 * This module starts a python back-end client, 
 * and pushs messages from the client to a queue.
 *
 * A queue is required to store new data sent from the 
 * audio back-end. Because if new audio data is used 
 * directly as an image by the shaders, those images 
 * may be used before they are loaded, which will cause 
 * flikering problems.
 */
Item{
// PlasmoidItem {

    // readonly property var cfg:Plasmoid.configuration

    property variant queue

    property var shaderSourceReader

    WebSocketServer {
        id: server
        listen: true
        onClientConnected: {
            webSocket.onTextMessageReceived.connect(function(message) {
                queue.push(message)
            });
        }
    }

    readonly property string startBackEnd:{
        if(server.port==0) return '';
        if(shaderSourceReader.image_shader_source=='') return ''
        var cmd=Utils.chdir_scripts_root()+'exec python3 -m panon.backend.client '
        cmd+=server.url //+':'+server.port
        var be=['pyaudio','soundcard','fifo'][Plasmoid.configuration.backendIndex]
        cmd+=' --backend='+be
        if(be=='soundcard')
            cmd+=' --device-index="'+Plasmoid.configuration.pulseaudioDevice+'"'
        if(be=='fifo')
            cmd+=' --fifo-path='+Plasmoid.configuration.fifoPath
        cmd+=' --fps='+Plasmoid.configuration.fps
        if(Plasmoid.configuration.reduceBass)
            cmd+=' --reduce-bass'
        if(Plasmoid.configuration.glDFT)
            cmd+=' --gldft'
        if(Plasmoid.configuration.debugBackend)
            cmd+=' --debug'
        cmd+=' --bass-resolution-level='+Plasmoid.configuration.bassResolutionLevel
        if(shaderSourceReader.enable_iChannel0)
            cmd+=' --enable-wave-data'
        if(shaderSourceReader.enable_iChannel1)
            cmd+=' --enable-spectrum-data'
        //var cmd=Utils.chdir_scripts_root()+'python3 -m panon.backend.client --backend=soundcard --device-index="allspeakers" --fps=30 --reduce-bass --debug --enable-spectrum-data ws://127.0.0.1:8765'
        if(Plasmoid.configuration.debugBackend){
            console.log('Executing: '+cmd)
            cmd='echo do nothing'
        }
        return cmd
    }

    // PlasmaCore.DataSource {
    Plasma5Support.DataSource {
        engine: 'executable'
        connectedSources: [startBackEnd]
        onNewData:{
            // Show back-end errors.
            //console.log(data.stdout)
            //console.log(data.stderr)
        }
    }

}
