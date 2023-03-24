//
//  ViewController.swift
//  1200505024SelimTekin
//
//  Created by Selim Tekin on 11.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var sureLabel: UILabel!
    @IBOutlet weak var skorLabel: UILabel!
    @IBOutlet weak var enYuksekSkorLabel: UILabel!
    
    
    @IBOutlet weak var lois1: UIImageView!
    @IBOutlet weak var meg1: UIImageView!
    @IBOutlet weak var peter1: UIImageView!
    @IBOutlet weak var stewie1: UIImageView!
    @IBOutlet weak var peter2: UIImageView!
    @IBOutlet weak var stewie2: UIImageView!
    @IBOutlet weak var lois2: UIImageView!
    @IBOutlet weak var meg2: UIImageView!
    @IBOutlet weak var meg3: UIImageView!
    @IBOutlet weak var peter3: UIImageView!
    @IBOutlet weak var lois3: UIImageView!
    @IBOutlet weak var stewie3: UIImageView!
    @IBOutlet weak var stewie4: UIImageView!
    @IBOutlet weak var lois4: UIImageView!
    @IBOutlet weak var meg4: UIImageView!
    @IBOutlet weak var peter4: UIImageView!
    
    var skor         = 0
    var enYuksekSkor = 0
    var zamanlayici  = Timer()
    var goruntuZamanlayici = Timer()
    var sayac        = 0
    var imageDizisi = [UIImageView] () // UIImageView türünde image'ları barındıran dizi
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        skorLabel.text = "Skor: \(skor)"
        
        let saklananEnYuksekSkor = UserDefaults.standard.object(forKey: "enYuksekSkor")
        
        if saklananEnYuksekSkor == nil{
            enYuksekSkor = 0
            enYuksekSkorLabel.text = "En Yüksek Skor: \(enYuksekSkor)"
        }
        
        if let yeniSkor = saklananEnYuksekSkor as? Int{
            enYuksekSkor = yeniSkor
            enYuksekSkorLabel.text = "En Yüksek Skor: \(enYuksekSkor)"
        }
	
        
        let genislik = view.frame.size.width
        let yukseklik = view.frame.size.height
        
        sureLabel.textAlignment = .center
        sureLabel.frame = CGRect(x: genislik*0.5 - genislik*0.4, y: yukseklik*0.05, width: genislik*0.8, height: yukseklik*0.05)
        
        skorLabel.textAlignment = .center
        skorLabel.frame = CGRect(x: genislik*0.5 - genislik*0.4, y: yukseklik*0.10, width: genislik*0.8, height: yukseklik*0.05)
        
        enYuksekSkorLabel.textAlignment = .center
        enYuksekSkorLabel.frame = CGRect(x: genislik*0.5 - genislik*0.4, y: yukseklik*0.95, width: genislik*0.8, height: yukseklik*0.05)
        
        
        lois1.frame = CGRect(x: genislik*0.1, y: yukseklik*0.15, width: genislik*0.2, height: yukseklik*0.2)
        
        meg1.frame = CGRect(x: genislik*0.3, y: yukseklik*0.15, width: genislik*0.2, height: yukseklik*0.2)
        
        peter1.frame = CGRect(x: genislik*0.5, y: yukseklik*0.15, width: genislik*0.2, height: yukseklik*0.2)
        
        stewie1.frame = CGRect(x: genislik*0.7, y: yukseklik*0.15, width: genislik*0.2, height: yukseklik*0.2)
        
        
        peter2.frame = CGRect(x: genislik*0.1, y: yukseklik*0.35, width: genislik*0.2, height: yukseklik*0.2)
        
        stewie2.frame = CGRect(x: genislik*0.3, y: yukseklik*0.35, width: genislik*0.2, height: yukseklik*0.2)
        
        lois2.frame = CGRect(x: genislik*0.5, y: yukseklik*0.35, width: genislik*0.2, height: yukseklik*0.2)
        
        meg2.frame = CGRect(x: genislik*0.7, y: yukseklik*0.35, width: genislik*0.2, height: yukseklik*0.2)
        
        
        meg3.frame = CGRect(x: genislik*0.1, y: yukseklik*0.55, width: genislik*0.2, height: yukseklik*0.2)
        
        peter3.frame = CGRect(x: genislik*0.3, y: yukseklik*0.55, width: genislik*0.2, height: yukseklik*0.2)
        
        lois3.frame = CGRect(x: genislik*0.5, y: yukseklik*0.55, width: genislik*0.2, height: yukseklik*0.2)
        
        stewie3.frame = CGRect(x: genislik*0.7, y: yukseklik*0.55, width: genislik*0.2, height: yukseklik*0.2)
        
        
        stewie4.frame = CGRect(x: genislik*0.1, y: yukseklik*0.75, width: genislik*0.2, height: yukseklik*0.2)
        
        lois4.frame = CGRect(x: genislik*0.3, y: yukseklik*0.75, width: genislik*0.2, height: yukseklik*0.2)
        
        meg4.frame = CGRect(x: genislik*0.5, y: yukseklik*0.75, width: genislik*0.2, height: yukseklik*0.2)
        
        peter4.frame = CGRect(x: genislik*0.7, y: yukseklik*0.75, width: genislik*0.2, height: yukseklik*0.2)
        
    
        lois1.isUserInteractionEnabled = true
        meg1.isUserInteractionEnabled = true
        peter1.isUserInteractionEnabled = true
        stewie1.isUserInteractionEnabled = true
        peter2.isUserInteractionEnabled = true
        stewie2.isUserInteractionEnabled = true
        lois2.isUserInteractionEnabled = true
        meg2.isUserInteractionEnabled = true
        meg3.isUserInteractionEnabled = true
        peter3.isUserInteractionEnabled = true
        lois3.isUserInteractionEnabled = true
        stewie3.isUserInteractionEnabled = true
        stewie4.isUserInteractionEnabled = true
        lois4.isUserInteractionEnabled = true
        meg4.isUserInteractionEnabled = true
        peter4.isUserInteractionEnabled = true
        
        
        let jestAlgilayici1 = UITapGestureRecognizer(target: self, action: #selector(skorAzalt))
        let jestAlgilayici2 = UITapGestureRecognizer(target: self, action: #selector(sureAzalt))
        let jestAlgilayici3 = UITapGestureRecognizer(target: self, action: #selector(skorArttir5))
        let jestAlgilayici4 = UITapGestureRecognizer(target: self, action: #selector(skorArttir10))
        let jestAlgilayici5 = UITapGestureRecognizer(target: self, action: #selector(skorArttir5))
        let jestAlgilayici6 = UITapGestureRecognizer(target: self, action: #selector(skorArttir10))
        let jestAlgilayici7 = UITapGestureRecognizer(target: self, action: #selector(skorAzalt))
        let jestAlgilayici8 = UITapGestureRecognizer(target: self, action: #selector(sureAzalt))
        let jestAlgilayici9 = UITapGestureRecognizer(target: self, action: #selector(sureAzalt))
        let jestAlgilayici10 = UITapGestureRecognizer(target: self, action: #selector(skorArttir5))
        let jestAlgilayici11 = UITapGestureRecognizer(target: self, action: #selector(skorAzalt))
        let jestAlgilayici12 = UITapGestureRecognizer(target: self, action: #selector(skorArttir10))
        let jestAlgilayici13 = UITapGestureRecognizer(target: self, action: #selector(skorArttir10))
        let jestAlgilayici14 = UITapGestureRecognizer(target: self, action: #selector(skorAzalt))
        let jestAlgilayici15 = UITapGestureRecognizer(target: self, action: #selector(sureAzalt))
        let jestAlgilayici16 = UITapGestureRecognizer(target: self, action: #selector(skorArttir5))
        
        
        lois1.addGestureRecognizer(jestAlgilayici1)
        meg1.addGestureRecognizer(jestAlgilayici2)
        peter1.addGestureRecognizer(jestAlgilayici3)
        stewie1.addGestureRecognizer(jestAlgilayici4)
        peter2.addGestureRecognizer(jestAlgilayici5)
        stewie2.addGestureRecognizer(jestAlgilayici6)
        lois2.addGestureRecognizer(jestAlgilayici7)
        meg2.addGestureRecognizer(jestAlgilayici8)
        meg3.addGestureRecognizer(jestAlgilayici9)
        peter3.addGestureRecognizer(jestAlgilayici10)
        lois3.addGestureRecognizer(jestAlgilayici11)
        stewie3.addGestureRecognizer(jestAlgilayici12)
        stewie4.addGestureRecognizer(jestAlgilayici13)
        lois4.addGestureRecognizer(jestAlgilayici14)
        meg4.addGestureRecognizer(jestAlgilayici15)
        peter4.addGestureRecognizer(jestAlgilayici16)
        
        
        imageDizisi = [lois1, lois2, lois3, lois4, peter1, peter2, peter3, peter4, meg1, meg2, meg3, meg4, stewie1, stewie2, stewie3, stewie4]
        
        sayac = 20 // Oyun süresi
        sureLabel.text = String(sayac)
        zamanlayici = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(geriyeSay), userInfo: nil, repeats: true)
        
        goruntuZamanlayici = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(goruntuSakla), userInfo: nil, repeats: true)
        
    }
    
    

    @objc func geriyeSay(){
        sayac = sayac - 1
        sureLabel.text = "Süre: \(String(sayac))"
        
        if sayac == 0 || sayac < 0{ // Süre dolunca
            zamanlayici.invalidate()
            goruntuZamanlayici.invalidate()
            
            for image in imageDizisi{
                image.isHidden = true
            }
            
            if self.skor > self.enYuksekSkor{
                self.enYuksekSkor = self.skor
                enYuksekSkorLabel.text = "En Yüksek Skor: \(self.enYuksekSkor)"
                
                UserDefaults.standard.set(self.enYuksekSkor, forKey: "enYuksekSkor")
            }
            
            
            let uyari = UIAlertController(title: "Süre Doldu!", message: "Tekrar Oynamak İster misiniz ?", preferredStyle: UIAlertController.Style.alert)
            let tamam = UIAlertAction(title: "Çıkış Yap", style: UIAlertAction.Style.cancel)
            let tekrarOyna = UIAlertAction(title: "Tekrar Oyna", style: UIAlertAction.Style.default){
                (UIAlertAction) in
                
                self.skor = 0
                self.skorLabel.text = "Skor: \(self.skor)"
                
                self.sayac = 20
                self.sureLabel.text = "Süre: \(String(self.sayac))"
                
                self.zamanlayici = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.geriyeSay), userInfo: nil, repeats: true)
                
                self.goruntuZamanlayici = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.goruntuSakla), userInfo: nil, repeats: true)

            }
            
            uyari.addAction(tamam)
            uyari.addAction(tekrarOyna)
            self.present(uyari, animated: true)
        }
    }
    
    @objc func goruntuSakla(){
        for image in imageDizisi{
            image.isHidden = true
        }
        
        let rastgele = Int(arc4random_uniform((UInt32(imageDizisi.count-1))))
        
        imageDizisi[rastgele].isHidden = false
    }
    
    @objc func skorArttir5(){
        skor = skor + 5
        skorLabel.text = "Skor: \(skor)"
    }
    
    @objc func skorArttir10(){
        skor = skor + 10
        skorLabel.text = "Skor: \(skor)"
    }
    
    @objc func skorAzalt(){
        skor = skor - 7
        skorLabel.text = "Skor: \(skor)"
    }
    
    @objc func sureAzalt(){
        sayac = sayac - 3
        sureLabel.text = "Süre: \(String(sayac))"
    }

}

