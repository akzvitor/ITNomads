
//
//  DescriptionView.swift
//  projetoITNomads
//
//  Created by Student08 on 14/07/23.
//

import SwiftUI

struct DescriptionView: View {
    var corPaisTop: String?
    var corPaisBot: String?
    var nomePais: String?
    var picture: String?
    var descricao: String?
    
    var body: some View {
        ScrollView{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color(corPaisTop!), Color(corPaisBot!)]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack{
                    Text(nomePais!)
                        .font(.largeTitle.bold())
                    AsyncImage(
                        url: URL(string: picture!),
                        content: { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 300, maxHeight: 300)
                        },
                        placeholder: {
                            ProgressView()
                        }
                    )
                    VStack(alignment: .leading){
                        Text(descricao!)
                    }
                    .padding(20)
                }
            }
        }
    }
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView(corPaisTop: String(), corPaisBot: String(), nomePais: String(), picture: String(), descricao: String())
    }
}
