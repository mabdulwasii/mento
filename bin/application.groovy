wschat.enableSecurity = 'true'
// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.active = true
grails.plugin.springsecurity.userLookup.userDomainClassName = 'grails.plugin.wschat.ChatAuth'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'grails.plugin.wschat.ChatAuthChatRole'
grails.plugin.springsecurity.authority.className = 'grails.plugin.wschat.ChatRole'
grails.plugin.springsecurity.securityConfigType = "Annotation"
//grails.plugin.springsecurity.securityConfigType = 'InterceptUrlMap'
// grails.plugin.springsecurity.successHandler.defaultTargetUrl = '/wschat'
// grails.plugin.springsecurity.successHandler.alwaysUseDefault = true
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
        [pattern: '/**', access: ['IS_AUTHENTICATED_ANONYMOUSLY']]
]
plugin.springsecurity.controllerAnnotations.staticRules = [
        [pattern: '/**', access: ['IS_AUTHENTICATED_ANONYMOUSLY']],
        [pattern: '/error', access: ['IS_AUTHENTICATED_ANONYMOUSLY']],
        [pattern: '/index', access: ['IS_AUTHENTICATED_ANONYMOUSLY']],
        [pattern: '/index.gsp', access: ['IS_AUTHENTICATED_ANONYMOUSLY']],
        [pattern: '/shutdown', access: ['IS_AUTHENTICATED_ANONYMOUSLY']],
        [pattern: '/assets/**', access: ['IS_AUTHENTICATED_ANONYMOUSLY']],
        [pattern: '/**/js/**', access: ['IS_AUTHENTICATED_ANONYMOUSLY']],
        [pattern: '/**/css/**', access: ['IS_AUTHENTICATED_ANONYMOUSLY']],
        [pattern: '/**/images/**', access: ['IS_AUTHENTICATED_ANONYMOUSLY']],
        [pattern: '/**/favicon.ico', access: ['IS_AUTHENTICATED_ANONYMOUSLY']],
        [pattern: '/wsChat/**', access: ['IS_AUTHENTICATED_ANONYMOUSLY']],
        [pattern: '/wsChatAdmin/**', access: ['IS_AUTHENTICATED_ANONYMOUSLY']],
        [pattern: '/wsCamEndpoint/**', access: ['IS_AUTHENTICATED_ANONYMOUSLY']],
        [pattern: '/wsChatEndpoint/**', access: ['IS_AUTHENTICATED_ANONYMOUSLY']],
        [pattern: '/wsChatFileEndpoint/**', access: ['IS_AUTHENTICATED_ANONYMOUSLY']],
        [pattern: '/TicTacToeServer/**', access: ['IS_AUTHENTICATED_ANONYMOUSLY']],
        [pattern: '/wsCamEndpoint', access: ['IS_AUTHENTICATED_ANONYMOUSLY']],
        [pattern: '/wsChatEndpoint', access: ['IS_AUTHENTICATED_ANONYMOUSLY']],
        [pattern: '/wsChatFileEndpoint', access: ['IS_AUTHENTICATED_ANONYMOUSLY']],
        [pattern: '/TicTacToeServer', access: ['IS_AUTHENTICATED_ANONYMOUSLY']],
        [pattern: '/dbconsole/**', access: ['IS_AUTHENTICATED_ANONYMOUSLY']],
        [pattern: '/test/**', access: ['IS_AUTHENTICATED_ANONYMOUSLY']],
        [pattern: '/ChatClientEndpoint/**', access: ['IS_AUTHENTICATED_ANONYMOUSLY']],
        [pattern: '/WsChatClientEndpoint/**', access: ['IS_AUTHENTICATED_ANONYMOUSLY']],
        [pattern: '/WsChatClient/**', access: ['IS_AUTHENTICATED_ANONYMOUSLY']],
        [pattern: '/ChatClientEndpoint', access: ['IS_AUTHENTICATED_ANONYMOUSLY']],
        [pattern: '/WsChatClientEndpoint', access: ['IS_AUTHENTICATED_ANONYMOUSLY']],
        [pattern: '/**', access: ['IS_AUTHENTICATED_ANONYMOUSLY']]
]

grails.plugin.springsecurity.logout.postOnly = false
grails.plugin.springsecurity.successHandler.defaultTargetUrl = '/dashboard'

wschat.defaultperm = 'admin'
wschat.rooms = ['science', 'commercial', 'art']
wschat.showtitle = "no"
//wschat.appName = 'no'
wschat.addAppName = 'no'
//wschat.hostname='192.168.1.196:8080'
stunServers { iceServers = [[url: 'stun:stun.l.google.com:19302']] }
wschat.send.leftroom = 'yes'
wschat.send.joinroom = 'yes'
wschat.frontenduser = '_frontend'
wschat.storeForFrontEnd = true
wschat.dbstore = true
wschat.dbsupport = 'yes'
wschat.dbstore_pm_messages = true
wschat.dbstore_room_messages = true
wschat.debug = 'true'

wschat.dbstore_user_messages = true

wschat.offline_pm = true


wschat.liveChatAssistant = 'assistant' // the chat client assistant name.. so if userx requests chat .. userx_assistant = this what this is .
wschat.liveChatPerm = 'admin'  // this is the group of users that livechat belongs to and if those uses have an email address in profile they will also be emailed
// wschat.liveContactEmail='youremail@gmail.com' // this is the hard coded live chat email
// wschat.liveChatUsername='masterv'  // this is the nickname upon them joining a live request
// wschat.liveContactName='Mr V'  // this is the person that email title is set to
wschat.emailFrom = "me@domain.com"  //this is for sending emails
wschat.store_live_messages = true  // store records of offline messaging
wschat.enable_AI = true  // enable Aritificial Intelligence ? refer to ChatAI.groovy for example and understanding
wschat.liveChatTitle = "Mento Live chat"

//wschat.dbstore_user_messages=true
wschat.addFile = 'true'
wschat.addGame = 'true'

wschat.title = 'Mento Chat'


wschat.liveChatAskName = 'true'
wschat.liveChatAskEmail = 'true'
wschat.enable_Chat_AI = true
wschat.enable_Chat_BadWords = true

wschat.enable_Chat_Bot = 'true'

//wschat.wsProtocol='wss'
//wschat.siteProtocol='https'
wschat.hostname = 'localhost:9502'

//Mail Plugin
grails {
    mail {
        host = "smtp.gmail.com"
        port = 465
        username = "youracount@gmail.com"
        password = "yourpassword"
        props = ["mail.smtp.auth"                  : "true",
                 "mail.smtp.socketFactory.port"    : "465",
                 "mail.smtp.socketFactory.class"   : "javax.net.ssl.SSLSocketFactory",
                 "mail.smtp.socketFactory.fallback": "false"]
    }
}

def elasticsearchVersion = '2.3.3'
ext['elasticsearch.version'] = elasticsearchVersion

elasticSearch {
    datastoreImpl = 'hibernateDatastore'
}


ckeditor {

    config = "/js/myckconfig.js"

    skipAllowedItemsCheck = false

    defaultFileBrowser = "ofm"

    upload {

        basedir = "/uploads/"

        overwrite = false

        link {

            browser = true

            upload = false

            allowed = []

            denied = ['html', 'htm', 'php', 'php2', 'php3', 'php4', 'php5',

                      'phtml', 'pwml', 'inc', 'asp', 'aspx', 'ascx', 'jsp',

                      'cfm', 'cfc', 'pl', 'bat', 'exe', 'com', 'dll', 'vbs', 'js',
                      'reg',

                      'cgi', 'htaccess', 'asis', 'sh', 'shtml', 'shtm', 'phtm']

        }

        image {

            browser = true

            upload = true

            allowed = ['jpg', 'gif', 'jpeg', 'png']

            denied = []

        }

        flash {

            browser = false

            upload = false

            allowed = ['swf']

            denied = []

        }

    }
}
