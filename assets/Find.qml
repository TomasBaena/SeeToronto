import bb.cascades 1.2

Page {
    
    Container {layout: DockLayout {}
        background: backgroundPaint.imagePaint
        
        Container {
            verticalAlignment: VerticalAlignment.Center
            horizontalAlignment: HorizontalAlignment.Center
            Button {
                text: "Find Me Something to do!"
                onClicked: {
                    var r = Math.floor((Math.random () * 169)+0)             
                    var chosenItem = dataModel.data([r])
                    locationInfoPage.locationTitle.text = chosenItem.title
                    locationInfoPage.locationAddress.text = chosenItem.address
                    locationInfoPage.locationAdditional_address.text = chosenItem.additional_address
                    locationInfoPage.locationPhone.text = chosenItem.phone
                    locationInfoPage.locationEmail.text = chosenItem.email
                    locationInfoPage.locationWebSite.text = chosenItem.website
                    locationInfoPage.locationDescription.text = chosenItem.description
                    nav.push(locationInfoPage)
                }
            }
        }
    }
    attachedObjects: [
        ImagePaintDefinition {
            id: backgroundPaint		
            imageSource: "asset:///images/listBg.png"
        },
        XmlDataModel {
            id: dataModel
            source: "asset:///data/AllLocations.xml"
        }
    ]
}