# Админские BAT-скрипты
Коллекция сложных пользовательских скриптов Batch и PowerShell для оптимизации Windows, внесения изменений в реестр и устранения неполадок системы.

> [!WARNING]
> Имейте в виду, что BAT-файлы написаны для Windows 10/11. В BAT-файлах присутствует кириллица, и Windows 7 откроет их некорректно, так как в Windows 10/11 используются кодировки "1251" и "65001", а в Windows 7 используется кодировка "866".
> 
> Время от времени существующие BAT-файлы модернизируются, и иногда добавляются новые.
> 
> Также, многие BAT-файлы запускаются исключительно от имени администратора.

<details>
  <summary><b>Автоматическая блокировка ПК через определённое время.bat</b></summary>
  Вышеназванный BAT-файл предназначен для установки автоматической блокировки компьютера в ваше отсутствие, то есть, когда ПК остается без действий, он сам блокируется (подобно блокировке "Win+L"). Можете поменять на любой удобный для вас промежуток времени.<br>
  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Автоматическая%20блокировка%20ПК%20через%20определённое%20время.bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>

<details>
  <summary><b>Активация Internet Download Manager.bat</b></summary>
  Вышеназванный BAT-файл предназначен для активации программного обеспечения Internet Download Manager.<br>
  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Активация%20Internet%20Download%20Manager.bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>

<details>
  <summary><b>Активация Kaspersky Free на 1 год.bat</b></summary>
  Вышеназванный BAT-файл предназначен для продления лицензии антивируса Kaspersky Free на 1 год.<br>
  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Активация%20Kaspersky%20Free%20на%201%20год.bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>

<details>
  <summary><b>Включение секунд на часах в Панели уведомлений.bat</b></summary>
  Вышеназванный BAT-файл предназначен для включения секунд на часах в "Панели уведомлений". Предварительные версии часов в ранних Windows показывали секунды в часах на "Панели задач", однако от этого решили отказаться, так как постоянное обновление состояния плохо сказывалось на производительности.<br>
  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Включение%20секунд%20на%20часах%20в%20Панели%20уведомлений.bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>

<details>
  <summary><b>Выдача прав Администратора пользователю.bat</b></summary>
  Вышеназванный BAT-файл предназначен для выдачи прав администратора любому из пользователей.<br>
  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Выдача%20прав%20Администратора%20пользователю.bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>

<details>
  <summary><b>Выключить ПК.bat</b></summary>
  Вышеназванный BAT-файл предназначен для выключения компьютера после определенного промежутка времени, то есть после открытия BAT-файла, вы введёте таймаут в секундах, через которое выключится компьютера (отменяется открытием BAT-файла "Отмена выключения и перезагрузки ПК.bat").<br>
  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Выключить%20ПК.bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>
  
<details>
  <summary><b>Добавление нужных пунктов в контекстное меню.bat</b></summary>
  Вышеназванный BAT-файл предназначен для добавления удобных пунктов в контекстное меню рабочего стола. Он добавит пункт "Инструменты", в нем будут 5 подпунктов: Экранная клавиатура, Удаление временных файлов (очистка папок Temp), Сетевые подключения, Заблокировать ПК и Спящий режим.<br>
  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Добавление%20нужных%20пунктов%20в%20контекстное%20меню%20Рабочего%20стола.bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>

<details>
  <summary><b>Добавление пункта Запуск от имени Администратора в контекстное меню.bat</b></summary>
  Вышеназванный BAT-файл предназначен для добавления пункта "Запуск от имени Администратора" в контекстное меню, на случай, если вдруг по каким-либо причинам данный пункт пропал.<br>
  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Добавление%20пункта%20Запуск%20от%20имени%20Администратора%20в%20контекстное%20меню.bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>

<details>
  <summary><b>Добавление пунктов Разрешить-Запретить доступ в интернет в контекстное меню.bat</b></summary>
  Вышеназванный BAT-файл предназначен для добавления двух пунктов (Разрешить доступ в интернет/Запретить доступ в интернет) в контекстное меню EXE-файлов и их ярлыков, которые помогут заблокировать и разблокировать доступ в интернет любому программному обеспечению.<br>
  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Добавление%20пунктов%20Разрешить-Запретить%20доступ%20в%20интернет%20в%20контекстное%20меню.bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>

<details>
  <summary><b>Заблокировать ПК.bat</b></summary>
  Вышеназванный BAT-файл предназначен для блокирования (подобно блокировке "Win+L") компьютера после определенного промежутка времени, то есть после открытия BAT-файла, вы введёте таймаут в секундах, через которое компьютер будет заблокирован (отменяется закрытием BAT-файла).<br>
  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Заблокировать%20ПК.bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>

<details>
  <summary><b>Запуск Adobe-приложения с временной блокировкой интернета.bat</b></summary>
  Вышеназванный BAT-файл предназначен для создания BAT-файла, который предназначен для последовательных действий блокировки и разблокировки интернета программным обеспечениям пакета "Adobe Creative Cloud". Сначала вы выберите своё программное обеспечение, следом её год, следом количество секунд, на которое должно блокироваться доступ в интернет, следом BAT-файл будет создан рядом с EXE-файлом выбранного программного обеспечения, и от него ярлык на рабочем столе уже с применённым значком EXE-файла выбранного программного обеспечения, и названием "ПРОГРАММА ГОД (с блокировкой интернета)". Запускаете ярлык, сначала он блокирует интернет, следом запускает программное обеспечение, а через указанное вами время разблокирует интернет. Помогает, чтобы не возникали проблемы с лицензией, и нейрофильтры были доступны.<br>
  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Запуск%20Adobe-приложения%20с%20временной%20блокировкой%20интернета.bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>

<details>
  <summary><b>Инверсная схема указателя мыши.bat</b></summary>
  Вышеназванный BAT-файл предназначен для смены схемы указателя мыши на инверсную. Удобно при тёмной темы Windows.<br>
  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Инверсная%20схема%20указателя%20мыши.bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>

<details>
  <summary><b>Настройка автоматического выключения ПК в определённое время.bat</b></summary>
  Вышеназванный BAT-файл предназначен для установки автоматического выключения компьютера в ваше отсутствие, то есть, когда компьютер остается без действий, он сам выключается. Можете поменять на любой удобный для вас промежуток времени.<br>
  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Настройка%20автоматического%20выключения%20ПК%20в%20определённое%20время.bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>

<details>
<summary><b>Настройка автоматической блокировки ПК через определённое время.bat</b></summary>
  Вышеназванный BAT-файл предназначен для установки автоматической блокировки компьютера в ваше отсутствие, то есть, когда компьютер остается без действий, он сам блокируется (подобно блокировке "Win+L"). Можете поменять на любой удобный для вас промежуток времени.<br>
  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Настройка%20автоматической%20блокировки%20ПК%20через%20определённое%20время.bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>

<details>
  <summary><b>Настройка метрики сетевого интерфейса.bat</b></summary>
  Вышеназванный BAT-файл предназначен для настроек метрики сетевого интерфейса. Помогает при ошибке, когда Панель управления добавляет лишнее значение к заданной метрике.<br>
  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Настройка%20метрики%20сетевого%20интерфейса.bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>

<details>
  <summary><b>Настройка параметров быстродействия (Визуальные эффекты).bat</b></summary>
  Вышеназванный BAT-файл предназначен для настроек визуальных эффектов. Он выключает все функции ("Анимация на панели задач", "Анимация окон при свертывании и развертывании", "Анимированные элементы управления и элементы внутри окна", "Включение Peek", "Гладкое прокручивание списков", "Затухание меню после вызова команды", "Отбрасывание теней значками на рабочем столе", "Отображение прозрачного прямоугольника выделения", "Отображения содержимого окна при перетаскивании", "Отображение теней, отбрасываемых окнами", "Отображение тени под указателем мыши", "Скольжение при раскрытии списков", "Сохранение вида эскизов панели задач", "Эффекты затухания или скольжения при обращении к меню" и "Эффекты затухания или скольжения при появлении подсказок") кроме "Вывод эскизов вместо значков" и "Сглаживание неровностей экранных шрифтов".<br>
  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Настройка%20параметров%20быстродействия%20(Визуальные%20эффекты).bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>

<details>
  <summary><b>Настройка схемы управления питанием.bat</b></summary>
  Вышеназванный BAT-файл предназначен для смены схемы указателя мыши на инверсную. Удобно при тёмной темы Windows.<br>
  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Настройка%20схемы%20управления%20питанием.bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>

<details>
  <summary><b>Отключение DHCP и установка статического IP-адреса.bat</b></summary>
  Вышеназванный BAT-файл предназначен для отключения DHCP и установки статического IP-адреса. BAT-файл поможет в распространённой ошибке, когда при настройке статического IP-адреса, почему-то вместо привычного адреса 192.168.x.x устанавливается 169.254.x.x, и ничего кроме переустановки сетевого драйвера не помогает.<br>
  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Отключение%20DHCP%20и%20установка%20статического%20IP-адреса.bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>

<details>
  <summary><b>Отключение Hyper-V.bat</b></summary>
  Вышеназванный BAT-файл предназначен для полного отключения всех служб Hyper-V.<br>
  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Отключение%20Hyper-V.bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>

<details>
  <summary><b>Отключение надписей Активация Windows.bat</b></summary>
  Вышеназванный BAT-файл предназначен для отключения надоедливой всплывающей надписи справа снизу "Активация Windows. Чтобы активировать Windows перейдите в раздел "Параметры"." и надписи в персонализации Windows "Для персонализации компьютера нужно активировать Windows" даже если Windows не активирована.<br>
  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Отключение%20надписей%20Активация%20Windows.bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>

<details>
  <summary><b>Отключение ненужных компонентов.bat</b></summary>
  Вышеназванный BAT-файл предназначен для отключения компонентов Windows таких как: "Internet Explorer 11", "Hyper V", "Печать в PDF (Майкрософт)" и "Проигрыватель Windows Media Player". Также включается компонент "Клиент Telnet", можете убрать, если он вам не нужен.<br>
  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Отключение%20ненужных%20компонентов.bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>

<details>
  <summary><b>Отключение обновлений KMPlayer.bat</b></summary>
  Вышеназванный BAT-файл предназначен для отключения надоедливого ежедневного уведомления от проигрывателя KMPlayer X64 о проверке обновлений.<br>
  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Отключение%20обновлений%20KMPlayer.bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>

<details>
  <summary><b>Отключение службы BitLocker и автоматического шифрования дисков.bat</b></summary>
  Вышеназванный BAT-файл предназначен для полного отключения службы BitLocker и автоматического шифрования дисков, которые включаются автоматически при установки Windows.<br>
  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Отключение%20службы%20BitLocker%20и%20автоматического%20шифрования%20дисков.bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>

<details>
  <summary><b>Отключение телеметрии.bat</b></summary>
  Вышеназванный BAT-файл предназначен для полного отключения телеметрии Windows и её служб.<br>
  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Отключение%20телеметрии.bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>

<details>
  <summary><b>Отключение уведомлений в браузерах Заблокировано вашей организацией.bat</b></summary>
  Вышеназванный BAT-файл предназначен для отключения назойливого уведомлений в браузерах "Заблокировано вашей организацией""<br>
  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Отключение%20уведомлений%20в%20браузерах%20Заблокировано%20вашей%20организацией.bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>

<details>
  <summary><b>Отключение уведомлений от My Kaspersky.bat</b></summary>
  Вышеназванный BAT-файл предназначен для отключения надоедливого ежедневного уведомления от My Kaspersky о регистрации на сайте Kaspersky (нужно предварительно выключить самозащиту в антивирусе "Kaspersky").<br>
  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Отключение%20уведомлений%20от%20My%20Kaspersky.bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>

<details>
  <summary><b>Отключение Центра обновлений Windows.bat</b></summary>
  Вышеназванный BAT-файл предназначен для полного отключения "Центра обновлений Windows" и автообновлений Windows.<br>
  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Отключение%20Центра%20обновлений%20Windows.bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>

<details>
  <summary><b>Отмена выключения и перезагрузки ПК.bat</b></summary>
  Вышеназванный BAT-файл предназначен для отмены выключения или перезагрузки компьютера после определенного промежутка времени.<br>
  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Отмена%20выключения%20и%20перезагрузки%20ПК.bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>

<details>
  <summary><b>Очистка временных файлов.bat</b></summary>
  Вышеназванный BAT-файл предназначен для очистки папок Temp (папок с временными файлами), папки кэша "Internet Explorer/Edge (WebView), папки кэша видеокарты NVIDIA, папок "Автозапуск", папки кэша "Защитника Windows", папки ускорения загрузки Windows, папки кэша установок ПО, папки загруженных обновлений Windows, папки кэша обновлений Windows, папки журнала состояния ядра Windows, папки кэша установок Windows, системных журналов Windows, и на всякий случай добавлен пункт сброс счетчика скриншотов (счетчик скриншотов засоряет свой ключ в реестре при кадом скриншоте комбинацией горячих клавиш "Win+PrintScreen", и не обнуляет его при удалении скриншотов).<br>
  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Очистка%20временных%20файлов.bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>

<details>
  <summary><b>Очистка кэша эскизов.bat</b></summary>
  Вышеназванный BAT-файл предназначен для очистки кэша эскизов, что поможет вздохнуть проводнику Windows, при длительном использовании Windows.<br>
  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Очистка%20кэша%20эскизов.bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>

<details>
  <summary><b>Очистка сетей.bat</b></summary>
  Вышеназванный BAT-файл предназначен для очистки кэша сетей, то есть при кадом извлечении и вставлении кабеля Ethernet, адаптер переименовывается с "Сеть" на "Сеть 2", следом "Сеть 3" и так далее, данный BAT-файл обнулит счетчик и адаптер будет переименован снова в "Сеть".<br>
  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Очистка%20сетей.bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>

<details>
  <summary><b>Перезагрузить ПК.bat</b></summary>
  Вышеназванный BAT-файл предназначен для перезагрузки компьютера после определенного промежутка времени, то есть после открытия BAT-файла, вы введёте таймаут в секундах, через которое перезагрузится ПК (отменяется открытием BAT-файла "Отмена выключения и перезагрузки ПК.bat").<br>
  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Перезагрузить%20ПК.bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>

<details>
  <summary>🔴 <b>Подготовка Windows.bat</b></summary>
  Вышеназванный самый важный BAT-файл, и он предназначен для полной настройки Windows после еще установки. Перед запуском откройте его текстовым редактором, чтобы ознакомиться какие внесения он вносит, и убрать те, которые вам не нужны.<br>
  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Подготовка%20Windows.bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>

<details>
  <summary><b>Полная очистка настроек сети</b></summary>
  Вышеназванный BAT-файл предназначен для полной очистки настроек сети: сброс TCP/IP, сброс Winsock (сетевых библиотек), сброс настроек IPv4 и IPv6, сброс политики брандмауэра, очистка кэша DNS, освобождение и обновление IP-адресов и сброс DNS для всех адаптеров. Помогает после использования VPN-сервисов, которые засоряют настройки сети.<br>
  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Полная%20очистка%20настроек%20сети.bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>

<details>
  <summary><b>Полное отключение Защитника Windows.bat</b></summary>
  Вышеназванный BAT-файл предназначен для полного отключения "Защитника Windows", "Брандмауэра Защитника Windows", "Центра обеспечения безопасности" и всех их компонентов.<br>
  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Полное%20отключение%20Защитника%20Windows.bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>

<details>
  <summary><b>Проверка доступности подсети.bat</b></summary>
  Вышеназванный BAT-файл предназначен для проверки доступности подсети, а именно пинга всех IP-адресов в выбранной подсети.<br>
  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Проверка%20доступности%20подсети.bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>

<details>
  <summary><b>Разблокировка ярлыков на панели Ссылки от SmartScreen.bat</b></summary>
  Вышеназванный BAT-файл предназначен для разблокировки ярлыков на панели "Ссылки" панели задач от надоедливых уведомлений SmartScreen (это нужно не всем, но кто сталкивался, тот поймет).<br>
  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Разблокировка%20ярлыков%20на%20панели%20Ссылки%20от%20SmartScreen.bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>

<details>
  <summary><b>Сброс счетчика скриншотов.bat</b></summary>
  Вышеназванный BAT-файл предназначен для сброса счетчика скриншотов (счетчик скриншотов засоряет свой ключ в реестре при кадом скриншоте комбинацией горячих клавиш "Win+PrintScreen", и не обнуляет его при удалении скриншотов).<br>
  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Сброс%20счетчика%20скриншотов.bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>

<details>
  <summary><b>Скрытие локального диска C с Этот Компьютер.bat</b></summary>
  Вышеназванный BAT-файл предназначен для скрытия локального диска "C" с "Этот компьютер".<br>
  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Скрытие%20локального%20диска%20C%20с%20Этот%20Компьютер.bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>

<details>
  <summary><b>Смена автоматической директории командной строки.bat</b></summary>
  Вышеназванный BAT-файл предназначен для смены автоматической директории командной строки "C:\Users\ИМЯПОЛЬЗОВАТЕЛЯ" на удобную "C:\Users\ИМЯПОЛЬЗОВАТЕЛЯ\Desktop", чтобы можно было сразу работать с файлами на рабочем столе.<br>
  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Смена%20автоматической%20директории%20командной%20строки.bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>

<details>
  <summary><b>Смена пункта Sublime Text в контекстном меню на русский язык.bat</b></summary>
  Вышеназванный BAT-файл предназначен для смены пункта "Open with Sublime Text" в контекстном меню всех файлов на русский "Открыть в Sublime Text".<br>
  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Смена%20пункта%20Sublime%20Text%20в%20контекстном%20меню%20на%20русский%20язык.bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>

<details>
  <summary><b>Создание пустого файла hosts.bat</b></summary>
  Вышеназванный BAT-файл предназначен для создания пустого файла "hosts", который расположен по директории "C:\Windows\System32\drivers\etc". Если вдруг по каким-либо причинам файл "hosts" удалился/потерялся/исказился, то данный BAT-файл вам поможет.<br>
  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Создание%20пустого%20файла%20hosts.bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>

<details>
  <summary><b>Создание ярлыка расширенной панели управления.bat</b></summary>
  Вышеназванный BAT-файл предназначен для создания ярлыка расширенной "Панели управления" на рабочем столе, в котором значительно много пунктов администрирования Windows, что может помочь в некоторых случаях.<br>
  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Создание%20ярлыка%20расширенной%20панели%20управления.bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>

<details>
  <summary><b>Спящий режим ПК.bat</b></summary>
  Вышеназванный BAT-файл предназначен для спящего режима компьютера после определенного промежутка времени, то есть после открытия BAT-файла, вы введёте таймаут в секундах, через которое ПК уйдёт в спящий режим (отменяется закрытием BAT-файла).
<br>
  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Спящий%20режим%20ПК.bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>

<details>
  <summary><b>Удаление встроенного браузера Microsoft Edge.bat</b></summary>
  Вышеназванный BAT-файл предназначен для удаления встроенного браузера "Microsoft Edge", не смотря на то, какая версия у вас установлена.<br>
  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Удаление%20встроенного%20браузера%20Microsoft%20Edge.bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>

<details>
  <summary><b>Удаление папок из Этот компьютер.bat</b></summary>
  Вышеназванный BAT-файл предназначен для удаления всех папок (Объемные объекты, Рабочий стол, Документы, Загрузки, Музыка, Изображения и Видео) из "Этот компьютер".  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Удаление%20папок%20из%20Этот%20компьютер.bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>

<details>
  <summary><b>Удаление пункта Запуск от имени Администратора из контекстного меню.bat</b></summary>
  Вышеназванный BAT-файл предназначен для удаления пункта "Запуск от имени Администратора" из контекстного меню (вернуть можно BAT-файлом "Добавление пункта Запуск от имени Администратора в контекстное меню.bat").<br>
  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Удаление%20пункта%20Запуск%20от%20имени%20Администратора%20из%20контекстного%20меню.bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>

<details>
  <summary><b>Удаление пунктов Kaspersky из контекстного меню.bat</b></summary>
  Вышеназванный BAT-файл предназначен для удаления пунктов антивируса "Kaspersky" из контекстного меню (нужно предварительно выключить самозащиту в антивирусе "Kaspersky").<br>
  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Удаление%20пунктов%20KMPlayer%20из%20контекстного%20меню.bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>

<details>
  <summary><b>Удаление пунктов KMPlayer из контекстного меню.bat</b></summary>
  Вышеназванный BAT-файл предназначен для удаления пунктов видео-проигрывателя "KMPlayer" (таких как "Play in KMP" и "Enqueue in KMP") из контекстного меню.<br>
  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Удаление%20пунктов%20Kaspersky%20из%20контекстного%20меню.bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>

<details>
  <summary><b>Удаление пунктов PotPlayer из контекстного меню.bat</b></summary>
  Вышеназванный BAT-файл предназначен для удаления пунктов видео-проигрывателя "PotPlayer" (таких как "Play in PotPlayer" и "Enqueue in PotPlayer") из контекстного меню.<br>
  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Удаление%20пунктов%20PotPlayer%20из%20контекстного%20меню.bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>

<details>
  <summary><b>Удаление пунктов Proxifier из контекстного меню.bat</b></summary>
  Вышеназванный BAT-файл предназначен для удаления пунктов программного обеспечения "Proxifier" (таких как "add in Proxifier") из контекстного меню.<br>
  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Удаление%20пунктов%20Proxifier%20из%20контекстного%20меню.bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>

<details>
  <summary><b>Удаление пунктов Windows Media Player из контекстного меню.bat</b></summary>
  Вышеназванный BAT-файл предназначен для удаления пунктов видео-проигрывателя "Windows Media Player" (таких как "Воспроизвести с помощью Windows Media Player" и "добавить в плейлист Windows Media Player") из контекстного меню.<br>
  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Удаление%20пунктов%20Windows%20Media%20Player%20из%20контекстного%20меню.bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>

<details>
  <summary><b>Удаление щита из контекстного меню.bat</b></summary>
  Вышеназванный BAT-файл предназначен для удаления щита из контекстного меню "Запуск от имени Администратора".<br>
  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Удаление%20щита%20из%20контекстного%20меню.bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>

<details>
  <summary><b>Удаления папок кэша браузера Chrome.bat</b></summary>
  Вышеназванный BAT-файл предназначен для удаления папок "ChromiumTemp*", "chrome_BITS*" и "chrome_drag*" из директории "C:\Program Files", которые ежедневно создаются последними версиями браузера "Chrome".<br>
  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Удаления%20папок%20кэша%20браузера%20Chrome.bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>

<details>
  <summary><b>Установка Hyper-V.bat</b></summary>
  Вышеназванный BAT-файл предназначен для установки компонентов и служб платформы виртуализации "Hyper-V" в "Windows 10/11 Домашняя". Windows 11, как и предыдущие версии системы, включает поддержку платформы виртуализации "Hyper-V", позволяющую легко создавать и использовать виртуальные машины. Функция по умолчанию доступна лишь в редакциях Pro и Корпоративная, но при желании Hyper-V можно установить и в Windows 10/11 Домашняя.<br>
  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Установка%20Hyper-V.bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>

<details>
  <summary><b>Установка пакетов Microsoft VCR, WDR, XNA, DirectX и OpenAL.bat</b></summary>
  Вышеназванный BAT-файл предназначен для установки компонентов "Microsoft Visual C++ Redistributable (x86)", "Microsoft Visual C++ Redistributable (x64)", "Microsoft Visual Basic Runtime", "Microsoft Windows Desktop Runtime (x64)", "Microsoft XNA Framework Redistributable 4.0", "DirectX" и "OpenAL".<br>
  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Установка%20пакетов%20Microsoft%20VCR,%20WDR,%20XNA,%20DirectX%20и%20OpenAL.bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>

<details>
  <summary><b>Устранение ошибки Файл содержит вирус.bat</b></summary>
  Вышеназванный BAT-файл предназначен для устранения распространенной ошибки "Операция не была успешно завершена, так как файл содержит вирус" при запуске исполняемых EXE-файлов скачанных с интернета.<br>
  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Устранение%20ошибки%20Файл%20содержит%20вирус.bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>

<details>
  <summary><b>Устранение проблем с запуском файлов "setup.exe".bat</b></summary>
  Вышеназванный BAT-файл предназначен для устранение проблем с запуском файлов "setup.exe". Необычная проблема, с которой могут столкнуться пользователи при установке Windows 10 и 11, программ и игр путем запуска EXE-файла установщика.<br>
  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Устранение%20проблем%20с%20запуском%20файлов%20setup.exe.bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>

<details>
  <summary><b>Форматирование жёсткого диска или USB-накопителя.bat</b></summary>
  Вышеназванный BAT-файл предназначен для форматирования жёстких дисков и съёмных носителей (USB-накопителей). В нём можно выбрать букву диска, файловую систему, размер единицы распределения (кластера), метку тома и способ форматирования.<br>
  <a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/Форматирование%20жёсткого%20диска%20или%20USB-накопителя.bat">
    <img width="107" height="32" alt="Скачать" src="https://github.com/user-attachments/assets/85fc8ceb-5ae2-4717-a335-8089cdcd5893" />
  </a>
</details>

<a href="https://github.com/frostbittenbull/Batch-Admin-Scripts/raw/refs/heads/main/BAT-files/BAT-files.zip">
  <img width="107" height="32" alt="Безымянный-2" src="https://github.com/user-attachments/assets/3bc0cf33-9fc6-43d1-b86c-66705ad30531" />

</a>
