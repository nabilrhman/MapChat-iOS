//
//  CollectionReference.swift
//  mapchat
//
//  Created by Nabil Rahman on 12/7/19.
//  Copyright © 2019 Nabil Rahman. All rights reserved.
//

import Foundation
import FirebaseFirestore


enum FCollectionReference: String {
    case User
    case Typing
    case Recent
    case Message
    case Group
    case Call
}


func reference(_ collectionReference: FCollectionReference) -> CollectionReference{
    return Firestore.firestore().collection(collectionReference.rawValue)
}


