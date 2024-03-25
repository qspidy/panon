// import QtQuick 2.0
import QtQuick 
import org.kde.plasma.plasmoid 
import org.kde.plasma.core as PlasmaCore

PlasmoidItem {

    //readonly property var cfg:Plasmoid.configuration

    preferredRepresentation: compactRepresentation

    Spectrum{ }

    toolTipItem: Plasmoid.configuration.hideTooltip?tooltipitem:null

    Plasmoid.backgroundHints: PlasmaCore.Types.DefaultBackground | PlasmaCore.Types.ConfigurableBackground

    Item{id:tooltipitem}

}
