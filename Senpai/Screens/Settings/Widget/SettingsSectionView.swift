//
//  SettingsSectionView.swift
//  Senpai
//
//  Created by Hamza Butt on 8/12/23.
//

import SwiftUI

struct SectionItemStruct{
    let title:String
    let iconName:String?
    let subtitle:String
    var isOpen:Bool = false
}

struct SectionDetailsStruct{
    let title:String
    var sectionItems:[SectionItemStruct]
}




struct SettingsSectionView: View {
    
    @State var SETTING_SECTION:[SectionDetailsStruct] = [
        
        SectionDetailsStruct(title: "General", sectionItems: [
            
            
            SectionItemStruct(title: "Unlock Everything",iconName: "unlockIcon" ,subtitle: "Use the “+” shaped button on the home screen to upload your artwork. Content uploaded to Prism MUST be your intellectual property. "),
            SectionItemStruct(title: "Restore Purchases", iconName: "restoreIcon", subtitle: "Use the “+” shaped button on the home screen to upload your artwork. Content uploaded to Prism MUST be your intellectual property. "),
            SectionItemStruct(title: "My Collection", iconName: "myCollectionIcon", subtitle: "Use the “+” shaped button on the home screen to upload your artwork. Content uploaded to Prism MUST be your intellectual property. ")
        ]),
        
        
        SectionDetailsStruct(title: "FAQ", sectionItems: [
            SectionItemStruct(title: "What are SenpAI Avatars?", iconName: nil, subtitle: "Use the “+” shaped button on the home screen to upload your artwork. Content uploaded to Prism MUST be your intellectual property. "),
            SectionItemStruct(title: "How does SenpAI generate avatars?", iconName: nil, subtitle: "Use the “+” shaped button on the home screen to upload your artwork. Content uploaded to Prism MUST be your intellectual property. "),
            SectionItemStruct(title: "What kinds of avatars should I expect?", iconName: nil, subtitle: "Use the “+” shaped button on the home screen to upload your artwork. Content uploaded to Prism MUST be your intellectual property. "),
            SectionItemStruct(title: "How do I cancel my subscription?", iconName: nil, subtitle: "Use the “+” shaped button on the home screen to upload your artwork. Content uploaded to Prism MUST be your intellectual property. ")
        ]),
        
        
        
        SectionDetailsStruct(title: "Other", sectionItems: [
            SectionItemStruct(title: "Terms of Use", iconName: nil, subtitle: "Use the “+” shaped button on the home screen to upload your artwork. Content uploaded to Prism MUST be your intellectual property. "),
            SectionItemStruct(title: "Privacy Policy", iconName: nil, subtitle: "Use the “+” shaped button on the home screen to upload your artwork. Content uploaded to Prism MUST be your intellectual property. ")
        ])
        
        
        
        
        
    ]
    
    
    var body: some View {
        List {
            ForEach(0..<SETTING_SECTION.count, id: \.self) { index in
                
                Section(header: Text(SETTING_SECTION[index].title)
                    .font(.system(size: 20))
                    .foregroundColor(.black)
                    .bold()) {
                        
                        triggerListDesign(sectionIndex: index)
                        
                    }
            }
        }
        .listStyle(PlainListStyle())
    }
    
    

    func triggerListDesign(sectionIndex: Int) -> some View {
        ForEach(0..<SETTING_SECTION[sectionIndex].sectionItems.count, id: \.self) { index in
            if sectionIndex == 0{
                
                getSectionItem(SETTING_SECTION[sectionIndex].sectionItems[index])
                .overlay(NavigationLink(destination: getNavigationScreen(sectionIndex,index), label: {EmptyView()}))
                .padding(.horizontal, 20)
                .frame(minHeight: 50)
                
                
            }else{
                
                Button {
                    SETTING_SECTION[sectionIndex].sectionItems[index].isOpen.toggle()
                } label: {
                    getSectionItem(SETTING_SECTION[sectionIndex].sectionItems[index])
                }
                .padding(.horizontal, 20)
                .frame(minHeight: 50)
            }
            
            
        }
    }

    
    
    
    
    
    func getSectionItem(_ item:SectionItemStruct) -> some View{
        VStack(alignment: .leading,spacing: 15){
            
            HStack{
                
                HStack(spacing:8) {
                    if let icon = item.iconName{
                        Image(icon)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height:20)
                    }
                    
                    Text(item.title)
                        .font(.system(size: 14))
                        .fontWeight(.medium)
                }
                
                
                Spacer()
                Image("rightArrowBlack")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 10, height: 10)
                
            }
            
            if  item.isOpen{
                Text(item.subtitle)
                    .font(.system(size: 12))
                    .fontWeight(.regular)
            }
            
            
        }
    }
    
    
    
    
    
    func getNavigationScreen(_ sectionIndex: Int, _ itemIndex: Int) -> AnyView {
        if sectionIndex == 0 {
            if itemIndex == 0 {
                return AnyView(UnlockView())
            } else if itemIndex == 1 {
                return AnyView(TokenStore())
            } else {
                return AnyView(Text("Test"))
            }
        } else {
            return AnyView(Text("Test"))
        }
    }

    
    
}





struct SettingsSectionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SettingsSectionView()
        }
       
    }
}

