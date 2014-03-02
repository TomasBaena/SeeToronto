import bb.cascades 1.2

Page {
    Container {layout: DockLayout {}
        background: backgroundPaint.imagePaint
        Container {
            verticalAlignment: VerticalAlignment.Top
            background: backgroundPaint.searchPaint
            TextField {
                id: userInputSearch
                hintText: "Please enter entire location name"
            }
            Button {
                id: searchButton
                horizontalAlignment: HorizontalAlignment.Center
                text: "Search"
                onClicked: {
                    var i = 0
                    if (userInputSearch.text.toLowerCase()==dataModel.data([i]).title.toLowerCase()){
                        var chosenItem = dataModel.data([i])
                        locationInfoPage.locationTitle.text = chosenItem.title
                        locationInfoPage.locationAddress.text = chosenItem.address
                        locationInfoPage.locationAdditional_address.text = chosenItem.additional_address
                        locationInfoPage.locationPhone.text = chosenItem.phone
                        locationInfoPage.locationEmail.text = chosenItem.email
                        locationInfoPage.locationWebSite.text = chosenItem.website
                        locationInfoPage.locationDescription.text = chosenItem.description
                        robFordImage.scaleX = 0
                        nav.push(locationInfoPage)       
                    }
                    while (userInputSearch.text.toLowerCase()!=dataModel.data([i]).title.toLowerCase() && i < 170){
                        i++
                        if (userInputSearch.text.toLowerCase()==dataModel.data([i]).title.toLowerCase()){
                            var chosenItem = dataModel.data([i])
                            locationInfoPage.locationTitle.text = chosenItem.title
                            locationInfoPage.locationAddress.text = chosenItem.address
                            locationInfoPage.locationAdditional_address.text = chosenItem.additional_address
                            locationInfoPage.locationPhone.text = chosenItem.phone
                            locationInfoPage.locationEmail.text = chosenItem.email
                            locationInfoPage.locationWebSite.text = chosenItem.website
                            locationInfoPage.locationDescription.text = chosenItem.description
                            robFordImage.scaleX = 0
                            nav.push(locationInfoPage) 
                        }
                        if(i>168){
                            robFordAnimation.play() 
                        }
                    }                        
                
                }
            }
            Container {layout: DockLayout {}
                preferredHeight: maxHeight
                preferredWidth: maxWidth
                ImageView {
                    verticalAlignment: VerticalAlignment.Bottom
                    horizontalAlignment: HorizontalAlignment.Right
                    id: robFordImage
                    imageSource: "asset:///images/doge.png"
                    scaleX: 0
                    scaleY: 0
                    animations: [
                        SequentialAnimation {
                            id: robFordAnimation
                            animations: [
                                ScaleTransition {
                                    toX: 1
                                    toY: 1
                                    duration: 200
                                },
                                ScaleTransition {
                                    toX: 0
                                    toY: 0
                                    duration: 150
                                },
                                ScaleTransition {
                                    toX: 1
                                    toY: 1
                                    duration: 100
                                }
                            ]
                        }
                    ]
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
}
