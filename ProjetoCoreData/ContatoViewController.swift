//
//  ContatoViewController.swift
//  ProjetoCoreData
//
//  Created by Usuário Convidado on 13/10/25.
//

import UIKit
import CoreData

class ContatoViewController: UIViewController {
    
    @IBOutlet weak var txtNome: UITextField!
    @IBOutlet weak var txtTelefone: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func salvar(_ sender: Any) {
        // passando o conteúdo do formulário para o método de inserção
        saveData(nome: txtNome.text!, telefone: txtTelefone.text!, email: txtEmail.text!)
        
        // fechando a tela e voltando para a tabela principal
        self.navigationController?.popViewController(animated: true)
    }
    
    func saveData(nome:String, telefone:String, email:String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let entidade = NSEntityDescription.entity(forEntityName: "Paciente", in: managedContext)!
        
        // realizando o processo de inserção dos dados - INSERT
        let pessoa = NSManagedObject(entity: entidade, insertInto: managedContext)
        
        pessoa.setValue(nome, forKey: "nome")
        pessoa.setValue(telefone, forKey: "telefone")
        pessoa.setValue(email, forKey: "email")
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Não foi possível salvar. \(error), \(error.userInfo)")
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
