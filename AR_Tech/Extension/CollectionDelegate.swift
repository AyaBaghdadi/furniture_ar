
//
//  Technicalisto FCI
//

import UIKit

extension MainVC : UICollectionViewDelegate , UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.arrayObjs.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MainCell
        
        cell.imageCell.image = UIImage(named: self.arrayObjs[indexPath.row])
        
        return cell

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            
            self.selectedModel = "model_1"

        }else if indexPath.row == 1 {
            
            self.selectedModel = "model_2"

        }else if indexPath.row == 2 {
            
            self.selectedModel = "model_3"

        }else if indexPath.row == 3 {
            
            self.selectedModel = "model_4"

        }else if indexPath.row == 4 {
            
            self.selectedModel = "model_5"

        }else if indexPath.row == 5 {
            
            self.selectedModel = "model_6"

        }else if indexPath.row == 6 {
            
            self.selectedModel = "model_7"

        }else if indexPath.row == 7 {
            
            self.selectedModel = "model_8"

        }else if indexPath.row == 8 {
            
            self.selectedModel = "model_9"

        }else if indexPath.row == 9 {
            
            self.selectedModel = "model_10"

        }else if indexPath.row == 10 {
            
            self.selectedModel = "model_11"

        }
        
        self.showToast(message: "New Object Selected")

    }
    
    
}
