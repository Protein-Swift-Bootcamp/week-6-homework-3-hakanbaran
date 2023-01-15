//
//  Model.swift
//  Simpra Odev Deneme 5
//
//  Created by Hakan Baran on 15.01.2023.
//

import Foundation

/*
 12        {8}
 source        {2}
id    :    null
name    :    Haberturk.com
author    :    Habertürk
title    :    Dikkat böbrek kanseri sinsi ilerliyor! İşte en önemli risk faktörleri - Habertürk
description    :    Dünyada her yıl 400 binden fazla yeni böbrek kanseri teşhis ediliyor. 170 binden fazla kişi ise böbrek kanseri yüzünden yaşamını yitiriyor. Böbrek kanserlerinin erken evrede genellikle herhangi bir şikayete yol açmadığını belirten Doç. Dr. Emre Karabay, ileri…
url    :    https://www.haberturk.com/dikkat-bobrek-kanseri-sinsi-ilerliyor-iste-en-onemli-risk-faktorleri-3556225
urlToImage    :    https://im.haberturk.com/2023/01/14/ver1673702889/3556225_1200x627.jpg
publishedAt    :    2023-01-14T13:28:09Z
content    :    Deerli Haberturk.com okurlar.Haberturk.com ekibi olarak Türkiyede ve dünyada yaanan ve haber deeri tayan her türlü gelimeyi sizlere en hzl, en objektif ve en doyurucu ekilde ulatrmak için çalyoruz. Y… [+2178 chars]
 */

/*
 struct NewsAPIResponse: Codable{
     
     let results: [APIResponse]
     
 }
 
 */


struct NewsAPIResponse: Codable {
    
    let articles: [News]?
}

struct News: Codable {
    
    var author: String?
    var description: String?
    var urlToImage: String?
    
}







