# Unspash

The application is written on VIPER architecture. 
The async / await method was used to interact with the network layer. 
Instead of storing data locally, I connected Firebase Firestore with anonymous user authentication. 
During all the work on the project, SwiftLint was used, but for the release I removed it in order to completely remove cocoapods from the project and replace it with Swift Package Manager.

The main screen consists of a Collection View with a searchBar above it. When the application starts, this screen shows a collection of random images from Unsplash. Clicking on any image takes the user to a detailed information screen. 

This screen displays an enlarged image. You can also see the name of the author, there is a like button. When you click on this button, the image is added to favorites. There is also a "Show additional info" button. When you click on this button, Alert appears with additional information and a button to save the image to the device gallery. 

The "favorite photo" screen is a table of cells with a mini-version of the image and additional information. By swiping the cell to the left, the image can be removed from favorites. Also from here you can also get to the screen with detailed information about the photo.

Приложение полностью написано на архитектуре VIPER.
Для взаимодействия с сетевым слоем использовался метод async/await.
Вместо локального хранения данных я подключил Firebase Firestore с анонимной аутентификацией пользователя.
Во время всей работы над проектом использовался SwiftLint, но для релиза я его убрал, чтобы полностью убрать cocopods из проекта и заменить на Swift Package Manager.

Главный экран состоит из коллекции изображений с панелью поиска над ней. Когда приложение запускается, на этом экране отображается коллекция случайных изображений из Unsplash. При нажатии на любое изображение пользователь переходит на экран с подробной информацией.

На этом экране отображается увеличенная версия изображения и так же можно посмотреть имя автора, есть кнопка лайк. При нажатии на эту кнопку изображение добавляется в избранное. Также есть кнопка «Показать дополнительную информацию». При нажатии на эту кнопку появляется Alert-оповещение с дополнительной информацией и кнопкой для сохранения изображения в галерее устройства.

Экран Favorite представляет собой таблицу ячеек с мини-версией изображения и дополнительной информацией. Смахнув ячейку влево, изображение можно удалить из избранного. Также отсюда также можно попасть на экран с подробной информацией о фотографии.

Если продолжать работу над проектом, я бы добавил:
1. Локализацию.
2. Возможность поставить на раздел избранных фото код-пароль и FaceID.
