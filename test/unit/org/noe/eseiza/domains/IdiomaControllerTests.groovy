package org.noe.eseiza.domains



import org.junit.*
import grails.test.mixin.*

@TestFor(IdiomaController)
@Mock(Idioma)
class IdiomaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/idioma/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.idiomaInstanceList.size() == 0
        assert model.idiomaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.idiomaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.idiomaInstance != null
        assert view == '/idioma/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/idioma/show/1'
        assert controller.flash.message != null
        assert Idioma.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/idioma/list'

        populateValidParams(params)
        def idioma = new Idioma(params)

        assert idioma.save() != null

        params.id = idioma.id

        def model = controller.show()

        assert model.idiomaInstance == idioma
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/idioma/list'

        populateValidParams(params)
        def idioma = new Idioma(params)

        assert idioma.save() != null

        params.id = idioma.id

        def model = controller.edit()

        assert model.idiomaInstance == idioma
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/idioma/list'

        response.reset()

        populateValidParams(params)
        def idioma = new Idioma(params)

        assert idioma.save() != null

        // test invalid parameters in update
        params.id = idioma.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/idioma/edit"
        assert model.idiomaInstance != null

        idioma.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/idioma/show/$idioma.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        idioma.clearErrors()

        populateValidParams(params)
        params.id = idioma.id
        params.version = -1
        controller.update()

        assert view == "/idioma/edit"
        assert model.idiomaInstance != null
        assert model.idiomaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/idioma/list'

        response.reset()

        populateValidParams(params)
        def idioma = new Idioma(params)

        assert idioma.save() != null
        assert Idioma.count() == 1

        params.id = idioma.id

        controller.delete()

        assert Idioma.count() == 0
        assert Idioma.get(idioma.id) == null
        assert response.redirectedUrl == '/idioma/list'
    }
}
