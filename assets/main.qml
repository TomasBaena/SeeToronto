import bb.cascades 1.2
NavigationPane {
    id: nav
    Menu.definition: MenuDefinition {//swipe down menu
        helpAction: HelpActionItem {//help option
            onTriggered: {
                nav.push(helpPage);
            }
        }
    }
    Page {
        Container {layout: DockLayout {}
            background: backgroundPaint.imagePaint
            Container {layout: StackLayout {orientation: LayoutOrientation.TopToBottom}
                verticalAlignment: VerticalAlignment.Center
                horizontalAlignment: HorizontalAlignment.Left
                leftPadding: 50
                Button {
                    id: searchButton
                    preferredHeight: maxHeight
                    preferredWidth: 400
                    text: qsTr("Search") + Retranslate.onLocaleOrLanguageChanged
                    onClicked: {
                        nav.push(searchPage);
                    }
                } 
                Button {
                    id: categoryButton
                    preferredHeight: maxHeight
                    preferredWidth: 400
                    text: qsTr("Categories") + Retranslate.onLocaleOrLanguageChanged
                    onClicked: {
                        nav.push(categoryPage);
                    }
                }
                Button {
                    id: findButton
                    preferredHeight: maxHeight
                    preferredWidth: 400
                    text: qsTr("Find Something to do") + Retranslate.onLocaleOrLanguageChanged
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
    }
    
    attachedObjects: [  
        
        ImagePaintDefinition {
            id: backgroundPaint		
            imageSource: "asset:///images/mainBg.png"
        },    
        CaptureInfo{
            id: captureInfoPage
        },
        Locations {
            id: locationsPage
        },
        Search {
            id: searchPage
        },
        Category {
            id: categoryPage
        },
        Find {
            id: findPage
        },
        Help {
            id: helpPage
        },        
        LocationInfo {
            id: locationInfoPage
        },
        XmlDataModel {
            id: dataModel
            source: "asset:///data/AllLocations.xml"
        }
    ]

}
