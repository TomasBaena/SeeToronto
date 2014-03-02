import bb.cascades 1.2
Page { 
    Container {layout: DockLayout {}
        //background: backgroundPaint.imagePaint
        Container {          
            ListView {
                dataModel: XmlDataModel {source: captureInfoPage.captureInfoLabelGenre.text}
                onTriggered: {             
                    var chosenItem = dataModel.data(indexPath);
                    locationInfoPage.locationTitle.text = chosenItem.title
                    locationInfoPage.locationAddress.text = chosenItem.address
                    locationInfoPage.locationAdditional_address.text = chosenItem.additional_address
                    locationInfoPage.locationPhone.text = chosenItem.phone
                    locationInfoPage.locationEmail.text = chosenItem.email
                    locationInfoPage.locationWebSite.text = chosenItem.website
                    locationInfoPage.locationDescription.text = chosenItem.description
                    nav.push(locationInfoPage)
                }
                listItemComponents: [
                    
                    ListItemComponent {
                        type: "item"
                        CustomListItem {
                            dividerVisible: true
                            highlightAppearance: HighlightAppearance.Frame
                            preferredHeight: 150
                            Container {layout: DockLayout {}
                                horizontalAlignment: HorizontalAlignment.Center
                                ImageView {
                                    opacity: .5
                                    imageSource: "asset:///images/listItemBg.png"
                                } 
                                Container {layout: StackLayout {orientation: LayoutOrientation.LeftToRight}   
                                    horizontalAlignment: HorizontalAlignment.Center
                                    Label {
                                        verticalAlignment: VerticalAlignment.Center
                                        text: ListItemData.title
                                        textStyle.textAlign: TextAlign.Center
                                        
                                        multiline: true
                                        textStyle{
                                            color: Color.White
                                            fontSize: FontSize.XLarge
                                        }
                                    
                                    }    
                                }
                            }
                        }
                    }   
                ] 
            }
        }
        attachedObjects: [
            ImagePaintDefinition {
                id: backgroundPaint		
                imageSource: "asset:///images/listBg.png"
            }
        ]   
    }
}


