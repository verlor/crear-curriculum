package org.noe.eseiza.db.domain



import org.junit.*
import grails.test.mixin.*

@TestFor(RedSocialController)
@Mock(RedSocial)
class RedSocialControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/redSocial/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.redSocialInstanceList.size() == 0
        assert model.redSocialInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.redSocialInstance != null
    }

    void testSave() {
        controller.save()

        assert model.redSocialInstance != null
        assert view == '/redSocial/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/redSocial/show/1'
        assert controller.flash.message != null
        assert RedSocial.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/redSocial/list'

        populateValidParams(params)
        def redSocial = new RedSocial(params)

        assert redSocial.save() != null

        params.id = redSocial.id

        def model = controller.show()

        assert model.redSocialInstance == redSocial
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/redSocial/list'

        populateValidParams(params)
        def redSocial = new RedSocial(params)

        assert redSocial.save() != null

        params.id = redSocial.id

        def model = controller.edit()

        assert model.redSocialInstance == redSocial
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/redSocial/list'

        response.reset()

        populateValidParams(params)
        def redSocial = new RedSocial(params)

        assert redSocial.save() != null

        // test invalid parameters in update
        params.id = redSocial.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/redSocial/edit"
        assert model.redSocialInstance != null

        redSocial.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/redSocial/show/$redSocial.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        redSocial.clearErrors()

        populateValidParams(params)
        params.id = redSocial.id
        params.version = -1
        controller.update()

        assert view == "/redSocial/edit"
        assert model.redSocialInstance != null
        assert model.redSocialInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/redSocial/list'

        response.reset()

        populateValidParams(params)
        def redSocial = new RedSocial(params)

        assert redSocial.save() != null
        assert RedSocial.count() == 1

        params.id = redSocial.id

        controller.delete()

        assert RedSocial.count() == 0
        assert RedSocial.get(redSocial.id) == null
        assert response.redirectedUrl == '/redSocial/list'
    }
}
