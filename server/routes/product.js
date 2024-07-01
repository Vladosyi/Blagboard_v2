import express from 'express'
import ProductController from '../controllers/Product.js'
import ProductPropController from '../controllers/ProductProp.js'
import authMiddleware from '../middleware/authMiddleware.js'
import adminMiddleware from '../middleware/adminMiddleware.js'
// import visitMiddleware from '../middleware/visitMiddleware.js'


const router = new express.Router()

/*
 * Товары
 */


router.get('/getall/categoryId/:categoryId([0-9]+)/brandId/:brandId([0-9]+)', ProductController.getAll)

router.get('/getall/categoryId/:categoryId([0-9]+)', ProductController.getAll)

router.get('/getall/brandId/:brandId([0-9]+)', ProductController.getAll)

router.get('/getall', ProductController.getAll)

router.get('/getone/:id([0-9]+)', ProductController.getOne)

router.post('/create', /*authMiddleware, adminMiddleware,*/ ProductController.create)

router.put('/update/:id([0-9]+)', /*authMiddleware, adminMiddleware,*/ ProductController.update)

router.delete('/delete/:id([0-9]+)', /*authMiddleware, adminMiddleware,*/ProductController.delete)

/*
 * Свойства
 */


router.get('/:productId([0-9]+)/property/getall', ProductPropController.getAll)

router.get('/:productId([0-9]+)/property/getone/:id([0-9]+)', ProductPropController.getOne)

router.post(
    '/:productId([0-9]+)/property/create',
    authMiddleware,
    adminMiddleware,
    ProductPropController.create
)
// обновить свойство товара
router.put(
    '/:productId([0-9]+)/property/update/:id([0-9]+)',
    authMiddleware,
    adminMiddleware,
    ProductPropController.update
)
// удалить свойство товара
router.delete(
    '/:productId([0-9]+)/property/delete/:id([0-9]+)',
    authMiddleware,
    adminMiddleware,
    ProductPropController.delete
)


// Recommendation

router.get('/recommendation', ProductController.getDevicesByVisitsDescending)



export default router