package mento

import com.mento.utility.user.SystemAcademyOfficerUser
import com.mento.utility.user.SystemAdminUser
import com.mento.utility.user.SystemCounsellorUser
import com.mento.utility.user.SystemStudentUser
import grails.plugin.wschat.*
import grails.transaction.Transactional

@Transactional
class AddUserService {

    void addChatUser(String username, String email, ChatRole userRole) {
        ChatUser user
        ChatPermissions perm
        String defaultPermission = 'user'
        if (defaultPermission) {
            perm = ChatPermissions.findByName(defaultPermission)
            perm = perm ? perm : new ChatPermissions(name: defaultPermission).save(flush: true)
            user = ChatUser.findByUsername(username)
            if (!user) {
                def addlog = addLog()
                user = new ChatUser(username: username, permissions: perm, log: addlog, offlog: addlog).save(flush: true)

                //def springUser = new ChatAuth(username: username, password: 'admin').save(flush:true)
                //ChatAuthChatRole.create springUser, userRole, true
            }
            ChatUserProfile.findOrSaveWhere(chatuser: user, email: "${email}").save(flush: true)
        }

    }

    void addChatAdminUser(String username, String email, ChatRole adminRole) {
        ChatUser user
        ChatPermissions perm
        String defaultPermission = 'admin'
        if (defaultPermission) {
            perm = ChatPermissions.findByName(defaultPermission)
            perm = perm ? perm : new ChatPermissions(name: defaultPermission).save(flush: true)
            user = ChatUser.findByUsername(username)
            if (!user) {
                def addlog = addLog()
                user = new ChatUser(username: username, permissions: perm, log: addlog, offlog: addlog).save(flush: true)

                //def springUser = new ChatAuth(username: username, password: 'admin').save(flush:true)
                //ChatAuthChatRole.create springUser, userRole, true
            }
            ChatUserProfile.findOrSaveWhere(chatuser: user, email: "${email}").save(flush: true)
        }

    }

    void addSystemStudentUser(String username, String email, String firstname, String lastname, String title, ChatRole userRole) {

        SystemStudentUser user

        user = SystemStudentUser.findByUsername(username)
        if (!user) {
            user = new SystemStudentUser(username: username, email: "${email}", firstname: "${firstname}", lastName: "${lastname}", title: "${title}").save(flush: true)
        }

    }

    void addSystemAdminUser(String username, String email, String firstname, String lastname, String title, ChatRole userRole) {

        SystemAdminUser user

        user = SystemAdminUser.findByUsername(username)
        if (!user) {
            user = new SystemAdminUser(username: username, email: "${email}", firstname: "${firstname}", lastName: "${lastname}", title: "${title}").save(flush: true)

        }
    }

    void addSystemCounsellorUser(String username, String email, String firstname, String lastname, String title, ChatRole userRole) {

        SystemCounsellorUser user

        user = SystemCounsellorUser.findByUsername(username)
        if (!user) {
            user = new SystemCounsellorUser(username: username, email: "${email}", firstname: "${firstname}", lastName: "${lastname}", title: "${title}").save(flush: true)
        }

    }

    void addAcademyOfficerUser(String username, String email, String firstname, String lastname, String title, ChatRole userRole) {

        SystemAcademyOfficerUser user

        user = SystemAcademyOfficerUser.findByUsername(username)
        if (!user) {
            user = new SystemAcademyOfficerUser(username: username, email: "${email}", firstname: "${firstname}", lastName: "${lastname}", title: "${title}").save(flush: true)
        }
    }

    private ChatLog addLog() {
        ChatLog logInstance = new ChatLog(messages: [])
        if (!logInstance.save()) {
            log.debug "${logInstance.errors}"
        }
        return logInstance
    }
}