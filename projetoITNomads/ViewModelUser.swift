//
//  ViewModelUser.swift
//  projetoITNomads
//
//  Created by Student04 on 19/07/23.
//

import Foundation

struct User: Codable{
    let _id: String?
    let nome: String?
    let userName: String?
    let email: String?
    let fotoDePerfil: String?
    let fotoDeCapa: String?
    let idade: String?
    let paisOndeMora: String?
    let paisDeOrigem: String?
    let ocupacao: String?
}



class viewModelUser : ObservableObject {
    //@Published antes da propriedade chars indica que ela é uma propriedade publicada, o que significa que qualquer alteração nessa propriedade será automaticamente notificada aos observadores.
    @Published var chars : [User] = []
    
    //  A função fetch() é responsável por fazer uma solicitação de rede para recuperar dados de uma API. Ela cria uma instância de URL e verifica se a criação do URL foi bem-sucedida. Caso contrário, a função retorna imediatamente.
    func fetch(){
        guard let url = URL(string: "http://192.168.128.252:1880/readNomadsUsers" ) else{
            return
        }
        //A função usa URLSession.shared.dataTask(with:completionHandler:) para iniciar uma tarefa de solicitação de dados a partir do URL. O bloco de conclusão (data, _, error) é chamado quando a tarefa é concluída.
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            //Dentro do bloco de conclusão, é verificado se ocorreu algum erro ou se os dados foram retornados com sucesso. Se não houver erro e os dados estiverem disponíveis, é feito o parsing (análise) dos dados usando JSONDecoder() e tenta-se decodificar os dados em um array de objetos do tipo HaPo. A função decode(_:from:) pode lançar um erro, portanto, é usado um bloco do-catch para capturar qualquer erro que possa ocorrer.
            do {
                let parsed = try JSONDecoder().decode([User].self, from: data)
                
                //Se a decodificação for bem-sucedida, a atualização da propriedade chars é feita dentro de DispatchQueue.main.async. Isso é importante porque as atualizações de UI em SwiftUI devem ser feitas na thread principal (thread principal da interface do usuário), e o uso de DispatchQueue.main.async garante que a atribuição seja executada na thread principal.
                DispatchQueue.main.async {
                    
                    self?.chars = parsed
                    
                    
                }
            }catch{
                // Se ocorrer um erro durante a decodificação ou em qualquer outro momento do processo, o erro será impresso no console usando print(error).
                print("ERRO:::: \(error)")
            }
        }
        //Finalmente, a função resume() é chamada para iniciar a tarefa de solicitação de rede. Isso é necessário porque a tarefa é criada em um estado suspenso e precisa ser iniciada explicitamente.
        task.resume()
    }
    
    
}
