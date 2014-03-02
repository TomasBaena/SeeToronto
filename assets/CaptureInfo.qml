import bb.cascades 1.2

Page {
   property alias captureInfoLabel: captureInfoLabel
   property alias captureInfoLabelGenre: captureInfoLabelGenre
    Container {
        Label {
            id: captureInfoLabel
            text: ""
        }
        Label {
            id: captureInfoLabelGenre
            text: ""
        }
    }
}
