// import QtQuick 2.0
import QtQuick 2.15
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore

PlasmoidItem {

    readonly property var cfg:plasmoid.configuration

    preferredRepresentation: compactRepresentation

    compactRepresentation: Spectrum{}

    toolTipItem: cfg.hideTooltip?tooltipitem:null

    Plasmoid.backgroundHints: PlasmaCore.Types.DefaultBackground | PlasmaCore.Types.ConfigurableBackground

    Item{id:tooltipitem}

}
