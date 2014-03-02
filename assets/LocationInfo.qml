import bb.cascades 1.2
import bb.platform 1.0

Page {
    property alias locationTitle: locationTitle
    property alias locationAddress: locationAddress
    property alias locationAdditional_address: locationAdditional_address
    property alias locationPhone: locationPhone
    property alias locationEmail: locationEmail
    property alias locationWebSite: locationWebSite
    property alias locationDescription: locationDescription
    Container {layout: DockLayout {}
        //background: backgroundPaint.imagePaint
        background: Color.create ("#46453f")
        
        Container {
            Label {
                horizontalAlignment: HorizontalAlignment.Center
                id: locationTitle
                multiline: true
                text: ""
                textStyle {
                    base: SystemDefaults.TextStyles.TitleText
                    fontWeight: FontWeight.Bold
                    fontSize: FontSize.XXLarge
                    textAlign: TextAlign.Center
                
                }
            }
            ScrollView {
                horizontalAlignment: HorizontalAlignment.Center
                verticalAlignment: VerticalAlignment.Top
                Container {layout: StackLayout {orientation: LayoutOrientation.TopToBottom}
                    Container {
                        preferredWidth: maxWidth
                        bottomPadding: 15
                        background: Color.create ("#A391B7")
                        Label {
                            horizontalAlignment: HorizontalAlignment.Center
                            multiline: true
                            text: qsTr("Description") + Retranslate.onLocaleOrLanguageChanged
                            textStyle {
                                base: headerStyle.style
                            }
                        }
                        Label {
                            id: locationDescription
                            horizontalAlignment: HorizontalAlignment.Center
                            multiline: true
                            text: ""
                            textStyle {
                                base: bodyStyle.style
                                textAlign: textAlign.Center
                            }
                        }
                    }
                    Container {
                        horizontalAlignment: HorizontalAlignment.Center
                        bottomPadding: 15
                        Label {
                            horizontalAlignment: HorizontalAlignment.Center
                            multiline: true
                            text: qsTr("Address") + Retranslate.onLocaleOrLanguageChanged
                            textStyle {
                                base: headerStyle.style
                            }
                        }
                        Label {
                            id: locationAddress
                            horizontalAlignment: HorizontalAlignment.Center
                            multiline: true
                            text: ""
                            textStyle {
                                base: bodyStyle.style
                            }
                        }
                        Button {
                            text: "Map It"
                            horizontalAlignment: HorizontalAlignment.Center
                            onClicked: {
                                locationInvokerID.searchText=locationAddress.text+" Toronto"+" Ontario"
                                locationInvokerID.go();
                            }
                        }
                    }
                    Container {
                        preferredWidth: maxWidth
                        bottomPadding: 15
                        background: Color.create ("#A391B7")
                        Label {
                            horizontalAlignment: HorizontalAlignment.Center
                            multiline: true
                            text: qsTr("Additional Address Info") + Retranslate.onLocaleOrLanguageChanged
                            textStyle {
                                base: headerStyle.style
                            }
                        }
                        Label {
                            id: locationAdditional_address
                            horizontalAlignment: HorizontalAlignment.Center
                            multiline: true
                            text: ""
                            textStyle {
                                base: bodyStyle.style
                            }
                        }
                    }
                    Label {
                        horizontalAlignment: HorizontalAlignment.Center
                        multiline: true
                        text: qsTr("Phone Number") + Retranslate.onLocaleOrLanguageChanged
                        textStyle {
                            base: headerStyle.style
                        }
                    }
                    TextField {
                        id: locationPhone
                        horizontalAlignment: HorizontalAlignment.Center
                        text: ""
                        backgroundVisible: false
                        textStyle {
                            base: bodyStyle.style
                            textAlign: TextAlign.Center
                        }
                    }
                    Container {
                        preferredWidth: maxWidth
                        bottomPadding: 15
                        background: Color.create ("#A391B7")
                        Label {
                            horizontalAlignment: HorizontalAlignment.Center
                            multiline: true
                            text: qsTr("Email") + Retranslate.onLocaleOrLanguageChanged
                            textStyle {
                                base: headerStyle.style
                            }
                        }
                        Label {
                            id: locationEmail
                            horizontalAlignment: HorizontalAlignment.Center
                            multiline: true
                            text: ""
                            textStyle {
                                base: bodyStyle.style
                            }
                        }
                    }
                    Label {
                        horizontalAlignment: HorizontalAlignment.Center
                        multiline: true
                        text: qsTr("Website") + Retranslate.onLocaleOrLanguageChanged
                        textStyle {
                            base: headerStyle.style
                        }
                    }
                    
                    Button {
                        id: locationWebSite
                        horizontalAlignment: HorizontalAlignment.Center
                        text:""
                        onClicked: {
                            if(locationWebSite.text!="NA"){
                                Application.launchBrowser("http://www."+locationWebSite.text);
                            }
                        }
                    }
                }
            }
        }
        
        attachedObjects: [        
            LocationMapInvoker {
                id: locationInvokerID
                
                // This example shows how to bind properties to pre-defined values.
                // One can bind properties to values coming from other widgets 
                // within this QML page (e.g. text field's input)
                
                //centerLatitude :  45.416667    // Ottawa's latitude
                //centerLongitude : -75.7        // Ottawa's longitude
                //altitude : 200
                
                // Request for a given POI (point of interest) to be shown 
                // on the map also.
                
                //locationLatitude : 45.4555
                //locationLongitude : -75.68
                //locationName : "My Favorite location"
                // 'geocodeLocationEnabled' boolean property is not explicitly set, 
                // so it will be false.
                
                // Also request for a search around the center of map 
                // (as part of setting properties available on superclass MapInvoker)
                searchText : ""

            },
            TextStyleDefinition
            {
                id: headerStyle
                base: SystemDefaults.TextStyles.BodyText            
                fontWeight: FontWeight.Bold
                fontSize: FontSize.XLarge
                color: Color.White
                fontFamily: "Sans serif"
            },
            TextStyleDefinition
            {
                id: bodyStyle
                base: SystemDefaults.TextStyles.BodyText            
                fontWeight: FontWeight.Normal
                fontSize: FontSize.Medium
                color: Color.White
                fontFamily: "Helvetica"
            
            },
            ImagePaintDefinition {
                id: backgroundPaint		
                imageSource: "asset:///images/listBg.png"
            }        
        ]
    }
}