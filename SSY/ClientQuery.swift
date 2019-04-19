//
//  ClientQuery.swift
//  SSY
//
//  Created by Navi on 15/04/2019.
//  Copyright © 2019 Navi. All rights reserved.
//

import MobileBuySDK
import UIKit

class ClientQuery {

    static func mutationForLogin(email: String, password: String) -> Storefront.MutationQuery {
        let input = Storefront.CustomerAccessTokenCreateInput(email: email, password: password)
        return Storefront.buildMutation { $0
            .customerAccessTokenCreate(input: input) { $0
                .customerAccessToken { $0
                    .accessToken()
                    .expiresAt()
                }
                .customerUserErrors { $0
                    .code()
                    .field()
                    .message()
                }
            }
        }
    }
}
