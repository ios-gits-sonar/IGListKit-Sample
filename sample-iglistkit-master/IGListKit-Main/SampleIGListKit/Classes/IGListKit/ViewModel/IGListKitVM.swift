//
//  IGListKitVM.swift
//  SampleIGListKit
//
//  Created by Ajie Pramono Arganata on 05/11/20.
//  Copyright © 2020 GITS Indonesia. All rights reserved.
//

import UIKit
import HelperModule

class IGListKitVM: BaseVM {
    var loadListItem = Observable<[String]>()
    
    func loadData() {
        loadApi.property = false
        loadListItem.property = [
            "https://upload.wikimedia.org/wikipedia/commons/f/f0/Bae_Suzy_at_%27Vagabond%27_show_party_in_Seoul_on_May_24%2C_2019.png",
            "https://vignette.wikia.nocookie.net/kdramas/images/b/b9/Bae_Suzy_01.jpg/revision/latest/top-crop/width/360/height/450?cb=20180201161434",
            "https://i.pinimg.com/originals/ce/1a/c8/ce1ac825fe00e8fb8e7aa56f37177c9b.jpg",
            "https://wiki.d-addicts.com/images/thumb/6/63/Baesuzy.JPG/300px-Baesuzy.JPG",
            "https://awsimages.detik.net.id/community/media/visual/2019/10/01/edb7978a-23ea-49c1-b47f-cfae312420d3_43.png?w=700&q=90"
        ]
    }
}
