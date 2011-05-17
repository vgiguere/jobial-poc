package com.jobial.security

import com.jobial.domain.User
import com.jobial.domain.Profile

class AuthenticationService {

    static transactional = true
    def engageService
    def springSecurityService

    User janrainAuthenticate(def token){
        def response = engageService.authInfo(token)
        return postProcessAuthentication(response.responseAsJSONObject)
    }

    User postProcessAuthentication(authenticationInfo) {
        User registeredUser = User.findByEmail(authenticationInfo.profile.email)
        if(!registeredUser){
            registeredUser = new User(email:authenticationInfo.profile.email).save()
            Profile profile = new Profile(email:registeredUser.email).save()
        }

        return registeredUser
    }


}
