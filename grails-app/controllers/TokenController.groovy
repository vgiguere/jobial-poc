import com.jobial.domain.User

class TokenController {


    def authenticationService
    
    def index = {
        if (params.token) {
            def token = params.token
            User user = authenticationService.janrainAuthenticate(token)
            if(user){
                redirect (controller:'profile', action:'edit', id:user.email)
            }



        }
        else {
            redirect(uri: "/index.gsp")
        }
    }
}
