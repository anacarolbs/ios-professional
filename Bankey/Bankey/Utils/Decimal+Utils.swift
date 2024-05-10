//
//  DecimalUtils.swift
//  Bankey
//
//  Created by Ana Carolina Barbosa de Souza on 10/05/24.
//

import Foundation

extension Decimal {
    var doubleValue: Double {
        return NSDecimalNumber(decimal:self).doubleValue
    }
}
