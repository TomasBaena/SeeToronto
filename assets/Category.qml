import bb.cascades 1.2

Page { 
    Container {layout: DockLayout {}      
         //background: backgroundPaint.imagePaint
    Container {
        ImageView {
            imageSource: "asset:///images/categoriesTitle.png"
        }
        ListView {
            dataModel: XmlDataModel {source: "asset:///data/genres.xml"}
            onTriggered: {             
                var chosenItem = dataModel.data(indexPath);
                captureInfoPage.captureInfoLabel.text=chosenItem.name
                if(chosenItem.name=="Attractions"){
                    captureInfoPage.captureInfoLabelGenre.text="asset:///data/AttractionsLocations.xml"
                    nav.push(locationsPage); 
                }
                else if (chosenItem.name=="Beaches"){
                    captureInfoPage.captureInfoLabelGenre.text="asset:///data/BeachesLocations.xml"
                    nav.push(locationsPage); 
                }
                else if (chosenItem.name=="Cinemas"){
                    captureInfoPage.captureInfoLabelGenre.text="asset:///data/CinemasLocations.xml"
                    nav.push(locationsPage); 
                }
                else if (chosenItem.name=="Convention/Trade"){
                    captureInfoPage.captureInfoLabelGenre.text="asset:///data/TradeLocations.xml"
                    nav.push(locationsPage); 
                }
                else if (chosenItem.name=="Parks"){
                    captureInfoPage.captureInfoLabelGenre.text="asset:///data/ParksLocations.xml"
                    nav.push(locationsPage); 
                }
                else if (chosenItem.name=="Galleries"){
                    captureInfoPage.captureInfoLabelGenre.text="asset:///data/GalleryLocations.xml"
                    nav.push(locationsPage); 
                }
                else if (chosenItem.name=="Gardens"){
                    captureInfoPage.captureInfoLabelGenre.text="asset:///data/GardensLocations.xml"
                    nav.push(locationsPage); 
                }
                else if (chosenItem.name=="Museums"){
                    captureInfoPage.captureInfoLabelGenre.text="asset:///data/MuseumsLocations.xml"
                    nav.push(locationsPage); 
                }
                else if (chosenItem.name=="Performing Arts"){
                    captureInfoPage.captureInfoLabelGenre.text="asset:///data/PerformingartsLocations.xml"
                    nav.push(locationsPage); 
                }
                else if (chosenItem.name=="Police HQ"){
                    captureInfoPage.captureInfoLabelGenre.text="asset:///data/PoliceLocations.xml"
                    nav.push(locationsPage); 
                }
                else if (chosenItem.name=="Shopping"){
                    captureInfoPage.captureInfoLabelGenre.text="asset:///data/ShoppingLocations.xml"
                    nav.push(locationsPage); 
                }
                else if (chosenItem.name=="Sports/Entertainment"){
                    captureInfoPage.captureInfoLabelGenre.text="asset:///data/SportsLocations.xml"
                    nav.push(locationsPage); 
                }
                else if (chosenItem.name=="Transportation"){
                    captureInfoPage.captureInfoLabelGenre.text="asset:///data/TransportationLocations.xml"
                    nav.push(locationsPage); 
                }
                else if (chosenItem.name=="Visitor Info"){
                    captureInfoPage.captureInfoLabelGenre.text="asset:///data/VisitorInfoLocations.xml"
                    nav.push(locationsPage); 
                }
            
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
                                ImageView {
                                    preferredHeight: maxHeight
                                    imageSource: ListItemData.path
                                    layoutProperties: StackLayoutProperties {spaceQuota: 1}
                                }
                                Label {
                                    verticalAlignment: VerticalAlignment.Center
                                    text: ListItemData.name
                                    layoutProperties: StackLayoutProperties {spaceQuota: 3}
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
