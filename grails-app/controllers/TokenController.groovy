class TokenController {

    def engageService
    
    def index = {
        if (params.token) {
            // Retrieve Janrain token
            def token = params.token
            
            // Retrieve Janrain authentication info
            def response = engageService.authInfo(token)
            
            // Retrieve plain JSON response
            // See Janrain4j apidocs (http://janrain4j.googlecode.com/svn/docs/1.0.x/apidocs/index.html) for detailed information of data returned by EngageService.authInfo(string token) method
            def json = response.responseAsJSONObject.toString(4)
            
            // Render response
            def writer = new StringWriter()
            def builder = new groovy.xml.MarkupBuilder(writer)
            builder.pre json
            builder.a(href: createLink(uri: "/"), style: "color: #666; font: bold 11px/normal verdana, arial; text-decoration: none;", "Go back")
            render writer.toString()
        }
        else {
            redirect(uri: "/index.gsp")
        }
    }
}
