import org.noe.eseiza.security.domains.Role
import org.noe.eseiza.security.domains.User
import org.noe.eseiza.security.domains.UserRole

class BootStrap {

    def init = { servletContext ->
        def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
        def userRole = new Role(authority: 'ROLE_USER').save(flush: true)

        def testUser = new User(username: 'me', enabled: true, password: 'password')
        testUser.save(flush: true)

        UserRole.create testUser, adminRole, true
    }
    def destroy = {
    }
}
