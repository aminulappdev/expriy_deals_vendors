import 'package:get/get_navigation/src/root/internacionalization.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          // ResetPasswordScreen
          'reset_password_screen.title': 'Reset Password',
          'reset_password_screen.header_title': 'Let’s secure your space.',
          'reset_password_screen.header_subtitle':
              'Create a new password to secure your account.',
          'reset_password_screen.enter_new_password': 'Enter New Password',
          'reset_password_screen.confirm_password': 'Confirm Password',
          'reset_password_screen.update_password': 'Update Password',
          'reset_password_screen.enter_password': 'Enter password',
          'reset_password_screen.success_message':
              'Reset password successfully done',
          // OTPVerifyScreen
          'otp_verify_screen.title': 'OTP Verification',
          'otp_verify_screen.header_title': 'Enter OTP',
          'otp_verify_screen.header_subtitle':
              'We have just sent you 6 digit code via your email.',
          'otp_verify_screen.confirm_button': 'Confirm',
          'otp_verify_screen.didnt_receive_code': 'Didn’t receive code? ',
          'otp_verify_screen.resend_code': 'Resend code',
          'otp_verify_screen.resend_code_with_time': 'Resend code {time}s',
          'otp_verify_screen.success_message':
              'Otp verification successfully done',
          // OTPVerifyForgotScreen
          'otp_verify_forgot_screen.title': 'OTP Verification',
          'otp_verify_forgot_screen.header_title': 'Verify Your Identity',
          'otp_verify_forgot_screen.header_subtitle':
              'For your security, verify the code sent to your registered contact. Let’s confirm it’s you!',
          'otp_verify_forgot_screen.confirm_button': 'Confirm',
          'otp_verify_forgot_screen.resend_code': 'Resend code',
          'otp_verify_forgot_screen.resend_code_with_time':
              'Resend code {time}s',
          'otp_verify_forgot_screen.success_message':
              'Otp verification successfully done',
          // ForgotPasswordScreen
          'forgot_password_screen.title': 'Forgot Password',
          'forgot_password_screen.header_title': 'No worries!',
          'forgot_password_screen.header_subtitle':
              'Enter your registered email address or mobile number and we’ll send you instructions to reset your password. Let’s get you back on track quickly and securely!',
          'forgot_password_screen.email_address': 'Email Address',
          'forgot_password_screen.email_label': 'Email:',
          // VerifyEmailScreen
          'verify_email_screen.title': 'Verify Email',
          'verify_email_screen.check_email': 'Check Email',
          'verify_email_screen.check_email_subtitle':
              'Please check your email to verify your account.',
          'verify_email_screen.confirm_button': 'Confirm Now',
          // VerifyEmailScreenWithForgot
          'verify_email_forgot_screen.title': 'Check Email',
          'verify_email_forgot_screen.header_title': 'A letter has been sent.',
          'verify_email_forgot_screen.header_subtitle':
              'Your next step is inside your inbox. Check your email to unlock it.',
          'verify_email_forgot_screen.confirm_button': 'Read My Letter',
          // SignUpScreen
          'sign_up_screen.title': 'Sign Up',
          'sign_up_screen.header_title': 'Create New Account',
          'sign_up_screen.header_subtitle':
              'Please fill your detail information.',
          'sign_up_screen.full_name': 'Full Name',
          'sign_up_screen.shop_name': 'Shop Name',
          'sign_up_screen.email': 'Email',
          'sign_up_screen.upload_tax_documents': 'Upload your tax documents',
          'sign_up_screen.upload': 'Upload',
          'sign_up_screen.upload_again': 'Upload again',
          'sign_up_screen.share_location': 'Share your location',
          'sign_up_screen.verify_email': 'Verify Email',
          'sign_up_screen.already_have_account': 'Already have an account? ',
          'sign_up_screen.log_in': 'Log In',
          'sign_up_screen.enter_name': 'Enter name',
          'sign_up_screen.enter_shop_name': 'Enter shop name',
          'sign_up_screen.enter_email': 'Enter email',
          'sign_up_screen.enter_valid_email': 'Enter a valid email address',
          'sign_up_screen.success_message': 'New user created',
          'sign_up_screen.share_location_error':
              'Please share your location to proceed',
          // SignInScreen
          'sign_in_screen.title': 'Sign In',
          'sign_in_screen.header_title': 'Hi, Welcome back!',
          'sign_in_screen.header_subtitle':
              'Sign in to continue exploring the best deals',
          'sign_in_screen.email': 'Email',
          'sign_in_screen.password': 'Password',
          'sign_in_screen.sign_in': 'Sign in',
          'sign_in_screen.dont_have_account': 'Don’t have an account? ',
          'sign_in_screen.sign_up': 'Sign up',
          'sign_in_screen.enter_email': 'Enter email',
          'sign_in_screen.enter_valid_email': 'Enter a valid email address',
          'sign_in_screen.enter_password': 'Enter password',
          'sign_in_screen.success_message': 'Login successfully done',
          'sign_in_screen.fill_valid_email': 'Fill-up your valid email',
          // UpdateBankInfoScreen
          'update_bank_info_screen.title': 'Update Bank Info',
          'update_bank_info_screen.account_number': 'Account number',
          'update_bank_info_screen.routing_number': 'Routing number',
          'update_bank_info_screen.bank_name': 'Bank name',
          'update_bank_info_screen.bank_holder_name': 'Bankholder name',
          'update_bank_info_screen.bank_address': 'Bank address',
          'update_bank_info_screen.enter_account_number':
              'Enter account number',
          'update_bank_info_screen.enter_routing_number':
              'Enter routing number',
          'update_bank_info_screen.enter_bank_name': 'Enter bank name',
          'update_bank_info_screen.enter_bank_holder_name':
              'Enter bankholder name',
          'update_bank_info_screen.enter_bank_address': 'Enter bank address',
          'update_bank_info_screen.update_button': 'Update Bank Info',
          'update_bank_info_screen.success_message':
              'Bank info updated successfully',
          'update_bank_info_screen.error_message': 'Failed to update bank info',
          // CreateBankInfoScreen
          'create_bank_info_screen.title': 'Fill-up Bank Info',
          'create_bank_info_screen.account_number': 'Account number',
          'create_bank_info_screen.routing_number': 'Routing number',
          'create_bank_info_screen.bank_name': 'Bank name',
          'create_bank_info_screen.bank_holder_name': 'Bankholder name',
          'create_bank_info_screen.bank_address': 'Bank address',
          'create_bank_info_screen.enter_account_number':
              'Enter account number',
          'create_bank_info_screen.enter_routing_number':
              'Enter routing number',
          'create_bank_info_screen.enter_bank_name': 'Enter bank name',
          'create_bank_info_screen.enter_bank_holder_name':
              'Enter bankholder name',
          'create_bank_info_screen.enter_bank_address': 'Enter bank address',
          'create_bank_info_screen.save_button': 'Save Info',
          'create_bank_info_screen.success_message': 'Bank info created',
          'create_bank_info_screen.error_message': 'Failed to create bank info',
          // BankInfoScreen
          'bank_info_screen.title': 'Create Bank Info',
          'bank_info_screen.account_number': 'Account number',
          'bank_info_screen.routing_number': 'Routing number',
          'bank_info_screen.bank_name': 'Bank name',
          'bank_info_screen.bank_holder_name': 'Bankholder name',
          'bank_info_screen.bank_address': 'Bank address',
          'bank_info_screen.create_tooltip': 'Create new bank info',
          'bank_info_screen.edit_tooltip': 'Edit bank details',
          'bank_info_screen.existing_details_tooltip':
              'Bank details already exist',
          // ReviewScreen
          'review_screen.title': 'Your application is under review',
          'review_screen.subtitle':
              'We will notify you as soon as your account has been approved',
          // NotificationScreen
          'notification_screen.title': 'Notification',
          'notification_screen.all_notifications': 'All notifications',
          'notification_screen.no_notification': 'No notification',
          // MainButtonNavbarScreen
          'main_button_navbar_screen.home': 'Home',
          'main_button_navbar_screen.products': 'Products',
          'main_button_navbar_screen.orders': 'Orders',
          'main_button_navbar_screen.earnings': 'Earnings',
          'main_button_navbar_screen.profile': 'Profile',
          // EarningScreen
          'earning_screen.title': 'Earnings',
          'earning_screen.no_earnings_data': 'No earnings data available',
          'earning_screen.serial_column': 'Serial',
          'earning_screen.customer_name_column': 'Customer Name',
          'earning_screen.date_column': 'Date',
          'earning_screen.amount_column': 'Amount',
          'earning_screen.details_column': 'Details',
          'earning_screen.view_button': 'View',
          // EarningDetailsScreen
          'earning_details_screen.title': 'Earning Details',
          'earning_details_screen.full_name': 'Full name',
          'earning_details_screen.email': 'Email',
          'earning_details_screen.number': 'Number',
          'earning_details_screen.price_details': 'Price Details',
          'earning_details_screen.transaction_id': 'Transaction ID',
          'earning_details_screen.account_holder_name': 'A/C holder name',
          'earning_details_screen.received_amount': 'Received amount',
          // HomeScreen
          'home_screen.no_data_available': 'No data available',
          'home_screen.total_revenue': 'Total Revenue',
          'home_screen.total_products': 'Total Products',
          'home_screen.earning_summary': 'Earning Summary',
          'home_screen.no_earning_data': 'No earning data available',
          // OnboardingPage
          'onboarding_page.skip': 'Skip',
          // OnboardingScreen
          'onboarding_screen.button_get_started': 'Get Started',
          'onboarding_screen.button_keep_reading': 'Keep Reading',
          'onboarding_screen.button_begin_first_letter':
              'Begin Your First Letter',
          'onboarding_screen.page1_title':
              'Turn Near-Expiry Products into Sales!',
          'onboarding_screen.page1_subtitle':
              'Use our map view to find stores and products near you, or browse by categories.',
          'onboarding_screen.page2_title':
              'This is your space to care, to be heard, to feel safe.',
          'onboarding_screen.page2_subtitle': '',
          'onboarding_screen.page3_title':
              'You are safe here. You are seen. You are heard.',
          'onboarding_screen.page3_subtitle': '',
          // OrderScreen
          'order_screen.title': 'My Orders',
          'order_screen.no_order_details': 'No order details available',
          'order_screen.order_id_column': 'Order ID',
          'order_screen.customer_column': 'Customer',
          'order_screen.product_name_column': 'Product Name',
          'order_screen.quantity_column': 'Quantity',
          'order_screen.status_column': 'Status',
          'order_screen.amount_column': 'Amount',
          'order_screen.details_column': 'Details',
          // OrderDetailsScreen
          'order_details_screen.title': 'Order Details',
          'order_details_screen.order_id': 'Order Id',
          'order_details_screen.delivery_address': 'Delivery Address',
          'order_details_screen.date': 'Date',
          'order_details_screen.price_details': 'Price Details',
          'order_details_screen.price': 'Price',
          'order_details_screen.total': 'Total',
          'order_details_screen.status_pending': 'Pending',
          'order_details_screen.status_ongoing': 'Ongoing',
          'order_details_screen.status_delivered': 'Delivered',
          'order_details_screen.status_cancel': 'Cancel',
          'order_details_screen.success_message': 'Status updated to {status}',
          'order_details_screen.error_message': 'Failed to update status',
          // UpdateProductScreen
          'update_product_screen.title': 'Update product',
          'update_product_screen.upload_images': 'Upload images',
          'update_product_screen.add_product_images': 'Add product images',
          'update_product_screen.item_name': 'Item Name',
          'update_product_screen.item_details': 'Item Details',
          'update_product_screen.category': 'Category',
          'update_product_screen.item_price': 'Item Price',
          'update_product_screen.item_quantity': 'Item Quantity',
          'update_product_screen.expiry_date': 'Expiry Date',
          'update_product_screen.days': 'Days',
          'update_product_screen.discount': 'Discount %',
          'update_product_screen.enter_item_name': 'Enter item name',
          'update_product_screen.enter_item_details': 'Enter item details',
          'update_product_screen.select_category': 'Select Category',
          'update_product_screen.enter_price': 'Enter price',
          'update_product_screen.enter_quantity': 'Enter quantity',
          'update_product_screen.enter_expiry_date': 'Enter expiry date',
          'update_product_screen.enter_days': 'Enter days',
          'update_product_screen.enter_discount': 'Enter discount',
          'update_product_screen.no_categories_available':
              'No categories available',
          'update_product_screen.retry': 'Retry',
          'update_product_screen.update_product': 'Update Product',
          'update_product_screen.error_select_category':
              'Please select a category',
          'update_product_screen.success_message':
              'Product updated successfully',
          'update_product_screen.error_message': 'Failed to add product',
          // ProductScreen
          'product_screen.title': 'Products',
          'product_screen.search_products': 'Search products',
          'product_screen.add_product': 'Add product',
          'product_screen.no_categories_found': 'No categories found',
          'product_screen.no_products_found': 'No products found',
          'product_screen.no_matching_products': 'No matching products found',
          'product_screen.delete_success': 'Product deleted successfully',
          'product_screen.delete_error': '{error}',
          // ProductDetailScreen
          'product_detail_screen.title': 'Product Details',
          'product_detail_screen.product_details': 'Product Details',
          // AddProductScreen
          'add_product_screen.title': 'Add product',
          'add_product_screen.upload_images': 'Upload images',
          'add_product_screen.add_product_images': 'Add product images',
          'add_product_screen.item_name': 'Item Name',
          'add_product_screen.item_details': 'Item Details',
          'add_product_screen.category': 'Category',
          'add_product_screen.item_price': 'Item Price',
          'add_product_screen.item_quantity': 'Item Quantity',
          'add_product_screen.expiry_date': 'Expiry Date',
          'add_product_screen.days': 'Days',
          'add_product_screen.discount': 'Discount %',
          'add_product_screen.enter_item_name': 'Enter item name',
          'add_product_screen.enter_item_details': 'Enter item details',
          'add_product_screen.select_category': 'Select Category',
          'add_product_screen.enter_price': 'Enter price',
          'add_product_screen.enter_quantity': 'Enter quantity',
          'add_product_screen.enter_expiry_date': 'Enter expiry date',
          'add_product_screen.enter_days': 'Enter days',
          'add_product_screen.enter_discount': 'Enter discount',
          'add_product_screen.no_categories_available':
              'No categories available',
          'add_product_screen.retry': 'Retry',
          'add_product_screen.save': 'Save',
          'add_product_screen.error_select_category':
              'Please select a category',
          'add_product_screen.success_message': 'Product added successfully',
          'add_product_screen.error_message': 'Failed to add product',
          // AddCategoryScreen
          'add_category_screen.title': 'Add category',
          'add_category_screen.item_name': 'Item Name',
          'add_category_screen.upload_image':
              'Uplpad image', // Keeping typo as in original
          'add_category_screen.add_product': 'Add product',
          'add_category_screen.enter_email': 'Enter email',
          'add_category_screen.invalid_email': 'Enter a valid email address',
          'add_category_screen.save': 'Save',
          // ProfileScreen
          'profile_screen.edit_profile': 'Edit Profile',
          'profile_screen.edit_shop': 'Edit Shop',
          'profile_screen.bank_details': 'Bank Details',
          'profile_screen.widthdraw': 'Widthdaw', // Keeping typo as in original
          'profile_screen.connect_account': 'Connect Account',
          'profile_screen.settings': 'Settings',
          'profile_screen.notification': 'Notification',
          'profile_screen.change_password': 'Change password',
          'profile_screen.language': "Language",
          'profile_screen.support': 'Support',
          'profile_screen.policies': 'Policies',
          'profile_screen.about_us': 'About Us',
          'profile_screen.logout': 'Logout',
          'profile_screen.error_profile_not_available':
              'Profile data not available',
          'profile_screen.error_shop_not_available': 'Shop data not available',
          'profile_screen.error_link_not_available': 'Link not available',

          // EditProfileScreen
          'edit_profile.title': 'Edit Profile',
          'edit_profile.name': 'Name',
          'edit_profile.email_address': 'Email Address',
          'edit_profile.contact_information': 'Contact Information',
          'edit_profile.address': 'Address',
          'edit_profile.city': 'City',
          'edit_profile.state': 'State',
          'edit_profile.zipcode': 'Zipcode',
          'edit_profile.country': 'Country',
          'edit_profile.shop_name': 'Shop Name',
          'edit_profile.description': 'Description',
          'edit_profile.enter_name': 'Please enter name',
          'edit_profile.enter_contact_information':
              'Please enter contact information',
          'edit_profile.enter_address': 'Please enter address',
          'edit_profile.enter_city': 'Please enter city',
          'edit_profile.enter_state': 'Please enter state',
          'edit_profile.enter_zipcode': 'Please enter zipcode',
          'edit_profile.enter_country': 'Please enter country',
          'edit_profile.enter_shop_name': 'Please enter shop name',
          'edit_profile.enter_description': 'Please enter description',
          'edit_profile.success_message': 'Profile updated successfully',
          'edit_profile.error_message': 'Failed to update profile',
          // InfoScreen
          'info_screen.no_data_available': 'No data available',
          'info_screen.error_loading_data': 'Error loading data',
          'info_screen.about_us': 'About Us',
          // EditShopScreen
          'edit_shop_screen.title': 'Update Shop',
          'edit_shop_screen.shop_name': 'Shop Name',
          'edit_shop_screen.description': 'Description',
          'edit_shop_screen.address': 'Address',
          'edit_shop_screen.enter_shop_name': 'Please enter shop name',
          'edit_shop_screen.enter_description': 'Please enter description',
          'edit_shop_screen.enter_address': 'Please enter address',
          'edit_shop_screen.success_message': 'Shop updated',
          'edit_shop_screen.error_message': 'Failed to update shop',
          // ChangePasswordScreen
          'change_password_screen.title': 'Change Password',
          'change_password_screen.current_password': 'Current password',
          'change_password_screen.new_password': 'New password',
          'change_password_screen.confirm_password': 'Confirm password',
          'change_password_screen.enter_password': 'Enter password',
          'change_password_screen.success_message':
              'Change password successfully done',
          'change_password_screen.error_message': 'Failed to change password',
          // WidthdrawScreen
          'widthdraw_screen.title': 'Earnings',
          'widthdraw_screen.your_balance': 'Your Balance',
          'widthdraw_screen.withdraw': 'Withdraw',
          'widthdraw_screen.no_withdrawal_details':
              'No withdrawal details available',
          'widthdraw_screen.withdraw_id': 'Withdraw ID',
          'widthdraw_screen.amount': 'Amount',
          'widthdraw_screen.status': 'Status',
          'widthdraw_screen.date': 'Date',
          'widthdraw_screen.details': 'Details',
          // WidthdrawRequestScreen
          'widthdraw_request_screen.title': 'Widthdraw Request',
          'widthdraw_request_screen.amount': 'Amount',
          'widthdraw_request_screen.enter_amount': 'Enter amount',
          'widthdraw_request_screen.submit_request': 'Submit Request',
          'widthdraw_request_screen.success_message':
              'Widthdraw successfully done',
          'widthdraw_request_screen.error_message':
              'Failed to submit withdrawal request',
        },
        'es_ES': {
          // ResetPasswordScreen
          'reset_password_screen.title': 'Restablecer contraseña',
          'reset_password_screen.header_title': 'Aseguramos tu espacio.',
          'reset_password_screen.header_subtitle':
              'Crea una nueva contraseña para proteger tu cuenta.',
          'reset_password_screen.enter_new_password':
              'Ingresar nueva contraseña',
          'reset_password_screen.confirm_password': 'Confirmar contraseña',
          'reset_password_screen.update_password': 'Actualizar contraseña',
          'reset_password_screen.enter_password': 'Ingresar contraseña',
          'reset_password_screen.success_message':
              'Restablecimiento de contraseña exitoso',
          // OTPVerifyScreen
          'otp_verify_screen.title': 'Verificación de OTP',
          'otp_verify_screen.header_title': 'Ingresar OTP',
          'otp_verify_screen.header_subtitle':
              'Te hemos enviado un código de 6 dígitos a tu correo electrónico.',
          'otp_verify_screen.confirm_button': 'Confirmar',
          'otp_verify_screen.didnt_receive_code': '¿No recibiste el código? ',
          'otp_verify_screen.resend_code': 'Reenviar código',
          'otp_verify_screen.resend_code_with_time': 'Reenviar código {time}s',
          'otp_verify_screen.success_message': 'Verificación de OTP exitosa',
          // OTPVerifyForgotScreen
          'otp_verify_forgot_screen.title': 'Verificación de OTP',
          'otp_verify_forgot_screen.header_title': 'Verifica tu identidad',
          'otp_verify_forgot_screen.header_subtitle':
              'Por tu seguridad, verifica el código enviado a tu contacto registrado. ¡Confirmemos que eres tú!',
          'otp_verify_forgot_screen.confirm_button': 'Confirmar',
          'otp_verify_forgot_screen.resend_code': 'Reenviar código',
          'otp_verify_forgot_screen.resend_code_with_time':
              'Reenviar código {time}s',
          'otp_verify_forgot_screen.success_message':
              'Verificación de OTP exitosa',
          // ForgotPasswordScreen
          'forgot_password_screen.title': 'Olvidé mi contraseña',
          'forgot_password_screen.header_title': '¡No te preocupes!',
          'forgot_password_screen.header_subtitle':
              'Ingresa tu correo electrónico o número de móvil registrado y te enviaremos instrucciones para restablecer tu contraseña. ¡Te pondremos de vuelta en el camino rápidamente y de forma segura!',
          'forgot_password_screen.email_address': 'Dirección de correo',
          'forgot_password_screen.email_label': 'Correo:',
          // VerifyEmailScreen
          'verify_email_screen.title': 'Verificar correo',
          'verify_email_screen.check_email': 'Revisar correo',
          'verify_email_screen.check_email_subtitle':
              'Por favor, revisa tu correo para verificar tu cuenta.',
          'verify_email_screen.confirm_button': 'Confirmar ahora',
          // VerifyEmailScreenWithForgot
          'verify_email_forgot_screen.title': 'Revisar correo',
          'verify_email_forgot_screen.header_title': 'Se ha enviado una carta.',
          'verify_email_forgot_screen.header_subtitle':
              'Tu próximo paso está en tu bandeja de entrada. Revisa tu correo para desbloquearlo.',
          'verify_email_forgot_screen.confirm_button': 'Leer mi carta',
          // SignUpScreen
          'sign_up_screen.title': 'Registrarse',
          'sign_up_screen.header_title': 'Crear nueva cuenta',
          'sign_up_screen.header_subtitle':
              'Por favor, completa tu información detallada.',
          'sign_up_screen.full_name': 'Nombre completo',
          'sign_up_screen.shop_name': 'Nombre de la tienda',
          'sign_up_screen.email': 'Correo',
          'sign_up_screen.upload_tax_documents':
              'Subir tus documentos fiscales',
          'sign_up_screen.upload': 'Subir',
          'sign_up_screen.upload_again': 'Subir de nuevo',
          'sign_up_screen.share_location': 'Compartir tu ubicación',
          'sign_up_screen.verify_email': 'Verificar correo',
          'sign_up_screen.already_have_account': '¿Ya tienes una cuenta? ',
          'sign_up_screen.log_in': 'Iniciar sesión',
          'sign_up_screen.enter_name': 'Ingresar nombre',
          'sign_up_screen.enter_shop_name': 'Ingresar nombre de la tienda',
          'sign_up_screen.enter_email': 'Ingresar correo',
          'sign_up_screen.enter_valid_email':
              'Ingresar una dirección de correo válida',
          'sign_up_screen.success_message': 'Nuevo usuario creado',
          'sign_up_screen.share_location_error':
              'Por favor, comparte tu ubicación para continuar',
          // SignInScreen
          'sign_in_screen.title': 'Iniciar sesión',
          'sign_in_screen.header_title': '¡Hola, bienvenido de vuelta!',
          'sign_in_screen.header_subtitle':
              'Inicia sesión para seguir explorando las mejores ofertas',
          'sign_in_screen.email': 'Correo',
          'sign_in_screen.password': 'Contraseña',
          'sign_in_screen.sign_in': 'Iniciar sesión',
          'sign_in_screen.dont_have_account': '¿No tienes una cuenta? ',
          'sign_in_screen.sign_up': 'Registrarse',
          'sign_in_screen.enter_email': 'Ingresar correo',
          'sign_in_screen.enter_valid_email':
              'Ingresar una dirección de correo válida',
          'sign_in_screen.enter_password': 'Ingresar contraseña',
          'sign_in_screen.success_message': 'Inicio de sesión exitoso',
          'sign_in_screen.fill_valid_email': 'Completa con un correo válido',
          // UpdateBankInfoScreen
          'update_bank_info_screen.title': 'Actualizar información bancaria',
          'update_bank_info_screen.account_number': 'Número de cuenta',
          'update_bank_info_screen.routing_number': 'Número de ruta',
          'update_bank_info_screen.bank_name': 'Nombre del banco',
          'update_bank_info_screen.bank_holder_name': 'Nombre del titular',
          'update_bank_info_screen.bank_address': 'Dirección del banco',
          'update_bank_info_screen.enter_account_number':
              'Ingresar número de cuenta',
          'update_bank_info_screen.enter_routing_number':
              'Ingresar número de ruta',
          'update_bank_info_screen.enter_bank_name':
              'Ingresar nombre del banco',
          'update_bank_info_screen.enter_bank_holder_name':
              'Ingresar nombre del titular',
          'update_bank_info_screen.enter_bank_address':
              'Ingresar dirección del banco',
          'update_bank_info_screen.update_button':
              'Actualizar información bancaria',
          'update_bank_info_screen.success_message':
              'Información bancaria actualizada exitosamente',
          'update_bank_info_screen.error_message':
              'Error al actualizar información bancaria',
          // CreateBankInfoScreen
          'create_bank_info_screen.title': 'Completar información bancaria',
          'create_bank_info_screen.account_number': 'Número de cuenta',
          'create_bank_info_screen.routing_number': 'Número de ruta',
          'create_bank_info_screen.bank_name': 'Nombre del banco',
          'create_bank_info_screen.bank_holder_name': 'Nombre del titular',
          'create_bank_info_screen.bank_address': 'Dirección del banco',
          'create_bank_info_screen.enter_account_number':
              'Ingresar número de cuenta',
          'create_bank_info_screen.enter_routing_number':
              'Ingresar número de ruta',
          'create_bank_info_screen.enter_bank_name':
              'Ingresar nombre del banco',
          'create_bank_info_screen.enter_bank_holder_name':
              'Ingresar nombre del titular',
          'create_bank_info_screen.enter_bank_address':
              'Ingresar dirección del banco',
          'create_bank_info_screen.save_button': 'Guardar información',
          'create_bank_info_screen.success_message':
              'Información bancaria creada',
          'create_bank_info_screen.error_message':
              'Error al crear información bancaria',
          // BankInfoScreen
          'bank_info_screen.title': 'Crear información bancaria',
          'bank_info_screen.account_number': 'Número de cuenta',
          'bank_info_screen.routing_number': 'Número de ruta',
          'bank_info_screen.bank_name': 'Nombre del banco',
          'bank_info_screen.bank_holder_name': 'Nombre del titular',
          'bank_info_screen.bank_address': 'Dirección del banco',
          'bank_info_screen.create_tooltip': 'Crear nueva información bancaria',
          'bank_info_screen.edit_tooltip': 'Editar detalles bancarios',
          'bank_info_screen.existing_details_tooltip':
              'Los detalles bancarios ya existen',
          // ReviewScreen
          'review_screen.title': 'Tu solicitud está en revisión',
          'review_screen.subtitle':
              'Te notificaremos tan pronto como tu cuenta sea aprobada',
          // NotificationScreen
          'notification_screen.title': 'Notificación',
          'notification_screen.all_notifications': 'Todas las notificaciones',
          'notification_screen.no_notification': 'Sin notificaciones',
          // MainButtonNavbarScreen
          'main_button_navbar_screen.home': 'Inicio',
          'main_button_navbar_screen.products': 'Productos',
          'main_button_navbar_screen.orders': 'Pedidos',
          'main_button_navbar_screen.earnings': 'Ganancias',
          'main_button_navbar_screen.profile': 'Perfil',
          // EarningScreen
          'earning_screen.title': 'Ganancias',
          'earning_screen.no_earnings_data':
              'No hay datos de ganancias disponibles',
          'earning_screen.serial_column': 'Serial',
          'earning_screen.customer_name_column': 'Nombre del cliente',
          'earning_screen.date_column': 'Fecha',
          'earning_screen.amount_column': 'Monto',
          'earning_screen.details_column': 'Detalles',
          'earning_screen.view_button': 'Ver',
          // EarningDetailsScreen
          'earning_details_screen.title': 'Detalles de ganancias',
          'earning_details_screen.full_name': 'Nombre completo',
          'earning_details_screen.email': 'Correo',
          'earning_details_screen.number': 'Número',
          'earning_details_screen.price_details': 'Detalles de precio',
          'earning_details_screen.transaction_id': 'ID de transacción',
          'earning_details_screen.account_holder_name':
              'Nombre del titular de la cuenta',
          'earning_details_screen.received_amount': 'Monto recibido',
          // HomeScreen
          'home_screen.no_data_available': 'No hay datos disponibles',
          'home_screen.total_revenue': 'Ingresos totales',
          'home_screen.total_products': 'Productos totales',
          'home_screen.earning_summary': 'Resumen de ganancias',
          'home_screen.no_earning_data':
              'No hay datos de ganancias disponibles',
          // OnboardingPage
          'onboarding_page.skip': 'Omitir',
          // OnboardingScreen
          'onboarding_screen.button_get_started': 'Comenzar',
          'onboarding_screen.button_keep_reading': 'Seguir leyendo',
          'onboarding_screen.button_begin_first_letter':
              'Comienza tu primera carta',
          'onboarding_screen.page1_title':
              '¡Convierte productos próximos a vencer en ventas!',
          'onboarding_screen.page1_subtitle':
              'Usa nuestra vista de mapa para encontrar tiendas y productos cerca de ti, o navega por categorías.',
          'onboarding_screen.page2_title':
              'Este es tu espacio para cuidar, ser escuchado, sentirte seguro.',
          'onboarding_screen.page2_subtitle': '',
          'onboarding_screen.page3_title':
              'Estás seguro aquí. Eres visto. Eres escuchado.',
          'onboarding_screen.page3_subtitle': '',
          // OrderScreen
          'order_screen.title': 'Mis pedidos',
          'order_screen.no_order_details':
              'No hay detalles de pedidos disponibles',
          'order_screen.order_id_column': 'ID de pedido',
          'order_screen.customer_column': 'Cliente',
          'order_screen.product_name_column': 'Nombre del producto',
          'order_screen.quantity_column': 'Cantidad',
          'order_screen.status_column': 'Estado',
          'order_screen.amount_column': 'Monto',
          'order_screen.details_column': 'Detalles',
          // OrderDetailsScreen
          'order_details_screen.title': 'Detalles del pedido',
          'order_details_screen.order_id': 'ID de pedido',
          'order_details_screen.delivery_address': 'Dirección de entrega',
          'order_details_screen.date': 'Fecha',
          'order_details_screen.price_details': 'Detalles de precio',
          'order_details_screen.price': 'Precio',
          'order_details_screen.total': 'Total',
          'order_details_screen.status_pending': 'Pendiente',
          'order_details_screen.status_ongoing': 'En curso',
          'order_details_screen.status_delivered': 'Entregado',
          'order_details_screen.status_cancel': 'Cancelado',
          'order_details_screen.success_message':
              'Estado actualizado a {status}',
          'order_details_screen.error_message': 'Error al actualizar el estado',
          // UpdateProductScreen
          'update_product_screen.title': 'Actualizar producto',
          'update_product_screen.upload_images': 'Subir imágenes',
          'update_product_screen.add_product_images':
              'Agregar imágenes del producto',
          'update_product_screen.item_name': 'Nombre del artículo',
          'update_product_screen.item_details': 'Detalles del artículo',
          'update_product_screen.category': 'Categoría',
          'update_product_screen.item_price': 'Precio del artículo',
          'update_product_screen.item_quantity': 'Cantidad del artículo',
          'update_product_screen.expiry_date': 'Fecha de vencimiento',
          'update_product_screen.days': 'Días',
          'update_product_screen.discount': 'Descuento %',
          'update_product_screen.enter_item_name':
              'Ingresar nombre del artículo',
          'update_product_screen.enter_item_details':
              'Ingresar detalles del artículo',
          'update_product_screen.select_category': 'Seleccionar categoría',
          'update_product_screen.enter_price': 'Ingresar precio',
          'update_product_screen.enter_quantity': 'Ingresar cantidad',
          'update_product_screen.enter_expiry_date':
              'Ingresar fecha de vencimiento',
          'update_product_screen.enter_days': 'Ingresar días',
          'update_product_screen.enter_discount': 'Ingresar descuento',
          'update_product_screen.no_categories_available':
              'No hay categorías disponibles',
          'update_product_screen.retry': 'Reintentar',
          'update_product_screen.update_product': 'Actualizar producto',
          'update_product_screen.error_select_category':
              'Por favor, selecciona una categoría',
          'update_product_screen.success_message':
              'Producto actualizado exitosamente',
          'update_product_screen.error_message': 'Error al agregar producto',
          // ProductScreen
          'product_screen.title': 'Productos',
          'product_screen.search_products': 'Buscar productos',
          'product_screen.add_product': 'Agregar producto',
          'product_screen.no_categories_found': 'No se encontraron categorías',
          'product_screen.no_products_found': 'No se encontraron productos',
          'product_screen.no_matching_products':
              'No se encontraron productos coincidentes',
          'product_screen.delete_success': 'Producto eliminado exitosamente',
          'product_screen.delete_error': '{error}',
          // ProductDetailScreen
          'product_detail_screen.title': 'Detalles del producto',
          'product_detail_screen.product_details': 'Detalles del producto',
          // AddProductScreen
          'add_product_screen.title': 'Agregar producto',
          'add_product_screen.upload_images': 'Subir imágenes',
          'add_product_screen.add_product_images':
              'Agregar imágenes del producto',
          'add_product_screen.item_name': 'Nombre del artículo',
          'add_product_screen.item_details': 'Detalles del artículo',
          'add_product_screen.category': 'Categoría',
          'add_product_screen.item_price': 'Precio del artículo',
          'add_product_screen.item_quantity': 'Cantidad del artículo',
          'add_product_screen.expiry_date': 'Fecha de vencimiento',
          'add_product_screen.days': 'Días',
          'add_product_screen.discount': 'Descuento %',
          'add_product_screen.enter_item_name': 'Ingresar nombre del artículo',
          'add_product_screen.enter_item_details':
              'Ingresar detalles del artículo',
          'add_product_screen.select_category': 'Seleccionar categoría',
          'add_product_screen.enter_price': 'Ingresar precio',
          'add_product_screen.enter_quantity': 'Ingresar cantidad',
          'add_product_screen.enter_expiry_date':
              'Ingresar fecha de vencimiento',
          'add_product_screen.enter_days': 'Ingresar días',
          'add_product_screen.enter_discount': 'Ingresar descuento',
          'add_product_screen.no_categories_available':
              'No hay categorías disponibles',
          'add_product_screen.retry': 'Reintentar',
          'add_product_screen.save': 'Guardar',
          'add_product_screen.error_select_category':
              'Por favor, selecciona una categoría',
          'add_product_screen.success_message':
              'Producto agregado exitosamente',
          'add_product_screen.error_message': 'Error al agregar producto',
          // AddCategoryScreen
          'add_category_screen.title': 'Agregar categoría',
          'add_category_screen.item_name': 'Nombre del artículo',
          'add_category_screen.upload_image': 'Subir imagen', // Corrected typo
          'add_category_screen.add_product': 'Agregar producto',
          'add_category_screen.enter_email': 'Ingresar correo',
          'add_category_screen.invalid_email':
              'Ingresar una dirección de correo válida',
          'add_category_screen.save': 'Guardar',
          // ProfileScreen
          'profile_screen.edit_profile': 'Editar perfil',
          'profile_screen.edit_shop': 'Editar tienda',
          'profile_screen.bank_details': 'Detalles bancarios',
          'profile_screen.widthdraw': 'Retirar', // Corrected typo
          'profile_screen.connect_account': 'Conectar cuenta',
          'profile_screen.settings': 'Configuraciones',
          'profile_screen.notification': 'Notificación',
          'profile_screen.change_password': 'Cambiar contraseña',
          'profile_screen.language': 'Idioma',
          'profile_screen.support': 'Soporte',
          'profile_screen.policies': 'Políticas',
          'profile_screen.about_us': 'Sobre nosotros',
          'profile_screen.logout': 'Cerrar sesión',
          'profile_screen.error_profile_not_available':
              'Datos de perfil no disponibles',
          'profile_screen.error_shop_not_available':
              'Datos de la tienda no disponibles',
          'profile_screen.error_link_not_available': 'Enlace no disponible',
          // EditProfileScreen
          'edit_profile.title': 'Editar Perfil',
          'edit_profile.name': 'Nombre',
          'edit_profile.email_address': 'Dirección de Correo',
          'edit_profile.contact_information': 'Información de Contacto',
          'edit_profile.address': 'Dirección',
          'edit_profile.city': 'Ciudad',
          'edit_profile.state': 'Estado',
          'edit_profile.zipcode': 'Código Postal',
          'edit_profile.country': 'País',
          'edit_profile.shop_name': 'Nombre de la Tienda',
          'edit_profile.description': 'Descripción',
          'edit_profile.enter_name': 'Por favor, ingresa el nombre',
          'edit_profile.enter_contact_information':
              'Por favor, ingresa la información de contacto',
          'edit_profile.enter_address': 'Por favor, ingresa la dirección',
          'edit_profile.enter_city': 'Por favor, ingresa la ciudad',
          'edit_profile.enter_state': 'Por favor, ingresa el estado',
          'edit_profile.enter_zipcode': 'Por favor, ingresa el código postal',
          'edit_profile.enter_country': 'Por favor, ingresa el país',
          'edit_profile.enter_shop_name':
              'Por favor, ingresa el nombre de la tienda',
          'edit_profile.enter_description': 'Por favor, ingresa la descripción',
          'edit_profile.success_message': 'Perfil actualizado exitosamente',
          'edit_profile.error_message': 'Error al actualizar el perfil',

          // InfoScreen
          'info_screen.no_data_available': 'No hay datos disponibles',
          'info_screen.error_loading_data': 'Error al cargar datos',
          'info_screen.about_us': 'Sobre Nosotros',
          // EditShopScreen
          'edit_shop_screen.title': 'Actualizar tienda',
          'edit_shop_screen.shop_name': 'Nombre de la tienda',
          'edit_shop_screen.description': 'Descripción',
          'edit_shop_screen.address': 'Dirección',
          'edit_shop_screen.enter_shop_name':
              'Por favor, ingresa el nombre de la tienda',
          'edit_shop_screen.enter_description':
              'Por favor, ingresa la descripción',
          'edit_shop_screen.enter_address': 'Por favor, ingresa la dirección',
          'edit_shop_screen.success_message': 'Tienda actualizada',
          'edit_shop_screen.error_message': 'Error al actualizar la tienda',
          // ChangePasswordScreen
          'change_password_screen.title': 'Cambiar contraseña',
          'change_password_screen.current_password': 'Contraseña actual',
          'change_password_screen.new_password': 'Nueva contraseña',
          'change_password_screen.confirm_password': 'Confirmar contraseña',
          'change_password_screen.enter_password': 'Ingresar contraseña',
          'change_password_screen.success_message':
              'Cambio de contraseña exitoso',
          'change_password_screen.error_message':
              'Error al cambiar la contraseña',
          // WidthdrawScreen
          'widthdraw_screen.title': 'Ganancias',
          'widthdraw_screen.your_balance': 'Tu saldo',
          'widthdraw_screen.withdraw': 'Retirar',
          'widthdraw_screen.no_withdrawal_details':
              'No hay detalles de retiro disponibles',
          'widthdraw_screen.withdraw_id': 'ID de retiro',
          'widthdraw_screen.amount': 'Monto',
          'widthdraw_screen.status': 'Estado',
          'widthdraw_screen.date': 'Fecha',
          'widthdraw_screen.details': 'Detalles',
          // WidthdrawRequestScreen
          'widthdraw_request_screen.title': 'Solicitud de retiro',
          'widthdraw_request_screen.amount': 'Monto',
          'widthdraw_request_screen.enter_amount': 'Ingresar monto',
          'widthdraw_request_screen.submit_request': 'Enviar solicitud',
          'widthdraw_request_screen.success_message': 'Retiro exitoso',
          'widthdraw_request_screen.error_message':
              'Error al enviar la solicitud de retiro',
        },
        'hi_IN': {
          // ResetPasswordScreen
          'reset_password_screen.title': 'पासवर्ड रीसेट करें',
          'reset_password_screen.header_title': 'आइए आपका स्थान सुरक्षित करें।',
          'reset_password_screen.header_subtitle':
              'अपने खाते को सुरक्षित करने के लिए एक नया पासवर्ड बनाएं।',
          'reset_password_screen.enter_new_password': 'नया पासवर्ड दर्ज करें',
          'reset_password_screen.confirm_password': 'पासवर्ड की पुष्टि करें',
          'reset_password_screen.update_password': 'पासवर्ड अपडेट करें',
          'reset_password_screen.enter_password': 'पासवर्ड दर्ज करें',
          'reset_password_screen.success_message':
              'पासवर्ड रीसेट सफलतापूर्वक हो गया',
          // OTPVerifyScreen
          'otp_verify_screen.title': 'OTP सत्यापन',
          'otp_verify_screen.header_title': 'OTP दर्ज करें',
          'otp_verify_screen.header_subtitle':
              'हमने आपके ईमेल के माध्यम से 6 अंकों का कोड भेजा है।',
          'otp_verify_screen.confirm_button': 'पुष्टि करें',
          'otp_verify_screen.didnt_receive_code': 'कोड प्राप्त नहीं हुआ? ',
          'otp_verify_screen.resend_code': 'कोड पुनः भेजें',
          'otp_verify_screen.resend_code_with_time':
              'कोड पुनः भेजें {time} सेकंड',
          'otp_verify_screen.success_message': 'OTP सत्यापन सफलतापूर्वक हो गया',
          // OTPVerifyForgotScreen
          'otp_verify_forgot_screen.title': 'OTP सत्यापन',
          'otp_verify_forgot_screen.header_title': 'अपनी पहचान सत्यापित करें',
          'otp_verify_forgot_screen.header_subtitle':
              'आपकी सुरक्षा के लिए, अपने पंजीकृत संपर्क पर भेजे गए कोड को सत्यापित करें। आइए पुष्टि करें कि यह आप हैं!',
          'otp_verify_forgot_screen.confirm_button': 'पुष्टि करें',
          'otp_verify_forgot_screen.resend_code': 'कोड पुनः भेजें',
          'otp_verify_forgot_screen.resend_code_with_time':
              'कोड पुनः भेजें {time} सेकंड',
          'otp_verify_forgot_screen.success_message':
              'OTP सत्यापन सफलतापूर्वक हो गया',
          // ForgotPasswordScreen
          'forgot_password_screen.title': 'पासवर्ड भूल गए',
          'forgot_password_screen.header_title': 'कोई चिंता नहीं!',
          'forgot_password_screen.header_subtitle':
              'अपना पंजीकृत ईमेल पता या मोबाइल नंबर दर्ज करें और हम आपको पासवर्ड रीसेट करने के निर्देश भेजेंगे। आइए आपको जल्दी और सुरक्षित रूप से वापस पटरी पर लाएं!',
          'forgot_password_screen.email_address': 'ईमेल पता',
          'forgot_password_screen.email_label': 'ईमेल:',
          // VerifyEmailScreen
          'verify_email_screen.title': 'ईमेल सत्यापित करें',
          'verify_email_screen.check_email': 'ईमेल जांचें',
          'verify_email_screen.check_email_subtitle':
              'कृपया अपने खाते को सत्यापित करने के लिए अपना ईमेल जांचें।',
          'verify_email_screen.confirm_button': 'अब पुष्टि करें',
          // VerifyEmailScreenWithForgot
          'verify_email_forgot_screen.title': 'ईमेल जांचें',
          'verify_email_forgot_screen.header_title': 'एक पत्र भेजा गया है।',
          'verify_email_forgot_screen.header_subtitle':
              'आपका अगला कदम आपके इनबॉक्स में है। इसे अनलॉक करने के लिए अपना ईमेल जांचें।',
          'verify_email_forgot_screen.confirm_button': 'मेरा पत्र पढ़ें',
          // SignUpScreen
          'sign_up_screen.title': 'साइन अप करें',
          'sign_up_screen.header_title': 'नया खाता बनाएं',
          'sign_up_screen.header_subtitle': 'कृपया अपनी विस्तृत जानकारी भरें।',
          'sign_up_screen.full_name': 'पूरा नाम',
          'sign_up_screen.shop_name': 'दुकान का नाम',
          'sign_up_screen.email': 'ईमेल',
          'sign_up_screen.upload_tax_documents': 'अपने कर दस्तावेज अपलोड करें',
          'sign_up_screen.upload': 'अपलोड करें',
          'sign_up_screen.upload_again': 'फिर से अपलोड करें',
          'sign_up_screen.share_location': 'अपनी लोकेशन साझा करें',
          'sign_up_screen.verify_email': 'ईमेल सत्यापित करें',
          'sign_up_screen.already_have_account':
              'क्या आपके पास पहले से खाता है? ',
          'sign_up_screen.log_in': 'लॉग इन करें',
          'sign_up_screen.enter_name': 'नाम दर्ज करें',
          'sign_up_screen.enter_shop_name': 'दुकान का नाम दर्ज करें',
          'sign_up_screen.enter_email': 'ईमेल दर्ज करें',
          'sign_up_screen.enter_valid_email': 'एक वैध ईमेल पता दर्ज करें',
          'sign_up_screen.success_message': 'नया उपयोगकर्ता बनाया गया',
          'sign_up_screen.share_location_error':
              'कृपया आगे बढ़ने के लिए अपनी लोकेशन साझा करें',
          // SignInScreen
          'sign_in_screen.title': 'साइन इन करें',
          'sign_in_screen.header_title': 'हाय, वापस स्वागत है!',
          'sign_in_screen.header_subtitle':
              'सर्वोत्तम सौदों की खोज जारी रखने के लिए साइन इन करें',
          'sign_in_screen.email': 'ईमेल',
          'sign_in_screen.password': 'पासवर्ड',
          'sign_in_screen.sign_in': 'साइन इन करें',
          'sign_in_screen.dont_have_account': 'क्या आपके पास खाता नहीं है? ',
          'sign_in_screen.sign_up': 'साइन अप करें',
          'sign_in_screen.enter_email': 'ईमेल दर्ज करें',
          'sign_in_screen.enter_valid_email': 'एक वैध ईमेल पता दर्ज करें',
          'sign_in_screen.enter_password': 'पासवर्ड दर्ज करें',
          'sign_in_screen.success_message': 'लॉगिन सफलतापूर्वक हो गया',
          'sign_in_screen.fill_valid_email': 'अपना वैध ईमेल भरें',
          // UpdateBankInfoScreen
          'update_bank_info_screen.title': 'बैंक जानकारी अपडेट करें',
          'update_bank_info_screen.account_number': 'खाता संख्या',
          'update_bank_info_screen.routing_number': 'रूटिंग नंबर',
          'update_bank_info_screen.bank_name': 'बैंक का नाम',
          'update_bank_info_screen.bank_holder_name': 'खाताधारक का नाम',
          'update_bank_info_screen.bank_address': 'बैंक का पता',
          'update_bank_info_screen.enter_account_number':
              'खाता संख्या दर्ज करें',
          'update_bank_info_screen.enter_routing_number':
              'रूटिंग नंबर दर्ज करें',
          'update_bank_info_screen.enter_bank_name': 'बैंक का नाम दर्ज करें',
          'update_bank_info_screen.enter_bank_holder_name':
              'खाताधारक का नाम दर्ज करें',
          'update_bank_info_screen.enter_bank_address': 'बैंक का पता दर्ज करें',
          'update_bank_info_screen.update_button': 'बैंक जानकारी अपडेट करें',
          'update_bank_info_screen.success_message':
              'बैंक जानकारी सफलतापूर्वक अपडेट की गई',
          'update_bank_info_screen.error_message':
              'बैंक जानकारी अपडेट करने में विफल',
          // CreateBankInfoScreen
          'create_bank_info_screen.title': 'बैंक जानकारी भरें',
          'create_bank_info_screen.account_number': 'खाता संख्या',
          'create_bank_info_screen.routing_number': 'रूटिंग नंबर',
          'create_bank_info_screen.bank_name': 'बैंक का नाम',
          'create_bank_info_screen.bank_holder_name': 'खाताधारक का नाम',
          'create_bank_info_screen.bank_address': 'बैंक का पता',
          'create_bank_info_screen.enter_account_number':
              'खाता संख्या दर्ज करें',
          'create_bank_info_screen.enter_routing_number':
              'रूटिंग नंबर दर्ज करें',
          'create_bank_info_screen.enter_bank_name': 'बैंक का नाम दर्ज करें',
          'create_bank_info_screen.enter_bank_holder_name':
              'खाताधारक का नाम दर्ज करें',
          'create_bank_info_screen.enter_bank_address': 'बैंक का पता दर्ज करें',
          'create_bank_info_screen.save_button': 'जानकारी सहेजें',
          'create_bank_info_screen.success_message': 'बैंक जानकारी बनाई गई',
          'create_bank_info_screen.error_message':
              'बैंक जानकारी बनाने में विफल',
          // BankInfoScreen
          'bank_info_screen.title': 'बैंक जानकारी बनाएं',
          'bank_info_screen.account_number': 'खाता संख्या',
          'bank_info_screen.routing_number': 'रूटिंग नंबर',
          'bank_info_screen.bank_name': 'बैंक का नाम',
          'bank_info_screen.bank_holder_name': 'खाताधारक का नाम',
          'bank_info_screen.bank_address': 'बैंक का पता',
          'bank_info_screen.create_tooltip': 'नई बैंक जानकारी बनाएं',
          'bank_info_screen.edit_tooltip': 'बैंक विवरण संपादित करें',
          'bank_info_screen.existing_details_tooltip':
              'बैंक विवरण पहले से मौजूद हैं',
          // ReviewScreen
          'review_screen.title': 'आपका आवेदन समीक्षा के तहत है',
          'review_screen.subtitle':
              'जैसे ही आपका खाता स्वीकृत होगा, हम आपको सूचित करेंगे',
          // NotificationScreen
          'notification_screen.title': 'सूचना',
          'notification_screen.all_notifications': 'सभी सूचनाएं',
          'notification_screen.no_notification': 'कोई सूचना नहीं',
          // MainButtonNavbarScreen
          'main_button_navbar_screen.home': 'होम',
          'main_button_navbar_screen.products': 'उत्पाद',
          'main_button_navbar_screen.orders': 'ऑर्डर',
          'main_button_navbar_screen.earnings': 'कमाई',
          'main_button_navbar_screen.profile': 'प्रोफाइल',
          // EarningScreen
          'earning_screen.title': 'कमाई',
          'earning_screen.no_earnings_data': 'कोई कमाई डेटा उपलब्ध नहीं',
          'earning_screen.serial_column': 'सीरियल',
          'earning_screen.customer_name_column': 'ग्राहक का नाम',
          'earning_screen.date_column': 'तारीख',
          'earning_screen.amount_column': 'राशि',
          'earning_screen.details_column': 'विवरण',
          'earning_screen.view_button': 'देखें',
          // EarningDetailsScreen
          'earning_details_screen.title': 'कमाई का विवरण',
          'earning_details_screen.full_name': 'पूरा नाम',
          'earning_details_screen.email': 'ईमेल',
          'earning_details_screen.number': 'नंबर',
          'earning_details_screen.price_details': 'मूल्य विवरण',
          'earning_details_screen.transaction_id': 'लेनदेन आईडी',
          'earning_details_screen.account_holder_name': 'खाताधारक का नाम',
          'earning_details_screen.received_amount': 'प्राप्त राशि',
          // HomeScreen
          'home_screen.no_data_available': 'कोई डेटा उपलब्ध नहीं',
          'home_screen.total_revenue': 'कुल राजस्व',
          'home_screen.total_products': 'कुल उत्पाद',
          'home_screen.earning_summary': 'कमाई का सारांश',
          'home_screen.no_earning_data': 'कोई कमाई डेटा उपलब्ध नहीं',
          // OnboardingPage
          'onboarding_page.skip': 'छोड़ें',
          // OnboardingScreen
          'onboarding_screen.button_get_started': 'शुरू करें',
          'onboarding_screen.button_keep_reading': 'पढ़ना जारी रखें',
          'onboarding_screen.button_begin_first_letter':
              'अपना पहला पत्र शुरू करें',
          'onboarding_screen.page1_title':
              'निकट-अवधि समाप्ति वाले उत्पादों को बिक्री में बदलें!',
          'onboarding_screen.page1_subtitle':
              'हमारे मानचित्र दृश्य का उपयोग करके अपने पास की दुकानों और उत्पादों को खोजें, या श्रेणियों के अनुसार ब्राउज़ करें।',
          'onboarding_screen.page2_title':
              'यह आपका स्थान है देखभाल करने, सुने जाने, सुरक्षित महसूस करने के लिए।',
          'onboarding_screen.page2_subtitle': '',
          'onboarding_screen.page3_title':
              'आप यहाँ सुरक्षित हैं। आप देखे जाते हैं। आप सुने जाते हैं।',
          'onboarding_screen.page3_subtitle': '',
          // OrderScreen
          'order_screen.title': 'मेरे ऑर्डर',
          'order_screen.no_order_details': 'कोई ऑर्डर विवरण उपलब्ध नहीं',
          'order_screen.order_id_column': 'ऑर्डर आईडी',
          'order_screen.customer_column': 'ग्राहक',
          'order_screen.product_name_column': 'उत्पाद का नाम',
          'order_screen.quantity_column': 'मात्रा',
          'order_screen.status_column': 'स्थिति',
          'order_screen.amount_column': 'राशि',
          'order_screen.details_column': 'विवरण',
          // OrderDetailsScreen
          'order_details_screen.title': 'ऑर्डर विवरण',
          'order_details_screen.order_id': 'ऑर्डर आईडी',
          'order_details_screen.delivery_address': 'वितरण पता',
          'order_details_screen.date': 'तारीख',
          'order_details_screen.price_details': 'मूल्य विवरण',
          'order_details_screen.price': 'मूल्य',
          'order_details_screen.total': 'कुल',
          'order_details_screen.status_pending': 'लंबित',
          'order_details_screen.status_ongoing': 'चल रहा है',
          'order_details_screen.status_delivered': 'वितरित',
          'order_details_screen.status_cancel': 'रद्द',
          'order_details_screen.success_message':
              'स्थिति को {status} में अपडेट किया गया',
          'order_details_screen.error_message': 'स्थिति अपडेट करने में विफल',
          // UpdateProductScreen
          'update_product_screen.title': 'उत्पाद अपडेट करें',
          'update_product_screen.upload_images': 'छवियाँ अपलोड करें',
          'update_product_screen.add_product_images': 'उत्पाद छवियाँ जोड़ें',
          'update_product_screen.item_name': 'आइटम का नाम',
          'update_product_screen.item_details': 'आइटम का विवरण',
          'update_product_screen.category': 'श्रेणी',
          'update_product_screen.item_price': 'आइटम की कीमत',
          'update_product_screen.item_quantity': 'आइटम की मात्रा',
          'update_product_screen.expiry_date': 'समाप्ति तिथि',
          'update_product_screen.days': 'दिन',
          'update_product_screen.discount': 'छूट %',
          'update_product_screen.enter_item_name': 'आइटम का नाम दर्ज करें',
          'update_product_screen.enter_item_details': 'आइटम का विवरण दर्ज करें',
          'update_product_screen.select_category': 'श्रेणी चुनें',
          'update_product_screen.enter_price': 'कीमत दर्ज करें',
          'update_product_screen.enter_quantity': 'मात्रा दर्ज करें',
          'update_product_screen.enter_expiry_date': 'समाप्ति तिथि दर्ज करें',
          'update_product_screen.enter_days': 'दिन दर्ज करें',
          'update_product_screen.enter_discount': 'छूट दर्ज करें',
          'update_product_screen.no_categories_available':
              'कोई श्रेणियाँ उपलब्ध नहीं',
          'update_product_screen.retry': 'पुनः प्रयास करें',
          'update_product_screen.update_product': 'उत्पाद अपडेट करें',
          'update_product_screen.error_select_category':
              'कृपया एक श्रेणी चुनें',
          'update_product_screen.success_message':
              'उत्पाद सफलतापूर्वक अपडेट किया गया',
          'update_product_screen.error_message': 'उत्पाद जोड़ने में विफल',
          // ProductScreen
          'product_screen.title': 'उत्पाद',
          'product_screen.search_products': 'उत्पाद खोजें',
          'product_screen.add_product': 'उत्पाद जोड़ें',
          'product_screen.no_categories_found': 'कोई श्रेणियाँ नहीं मिलीं',
          'product_screen.no_products_found': 'कोई उत्पाद नहीं मिले',
          'product_screen.no_matching_products':
              'कोई मिलान करने वाले उत्पाद नहीं मिले',
          'product_screen.delete_success': 'उत्पाद सफलतापूर्वक हटाया गया',
          'product_screen.delete_error': '{error}',
          // ProductDetailScreen
          'product_detail_screen.title': 'उत्पाद विवरण',
          'product_detail_screen.product_details': 'उत्पाद विवरण',
          // AddProductScreen
          'add_product_screen.title': 'उत्पाद जोड़ें',
          'add_product_screen.upload_images': 'छवियाँ अपलोड करें',
          'add_product_screen.add_product_images': 'उत्पाद छवियाँ जोड़ें',
          'add_product_screen.item_name': 'आइटम का नाम',
          'add_product_screen.item_details': 'आइटम का विवरण',
          'add_product_screen.category': 'श्रेणी',
          'add_product_screen.item_price': 'आइटम की कीमत',
          'add_product_screen.item_quantity': 'आइटम की मात्रा',
          'add_product_screen.expiry_date': 'समाप्ति तिथि',
          'add_product_screen.days': 'दिन',
          'add_product_screen.discount': 'छूट %',
          'add_product_screen.enter_item_name': 'आइटम का नाम दर्ज करें',
          'add_product_screen.enter_item_details': 'आइटम का विवरण दर्ज करें',
          'add_product_screen.select_category': 'श्रेणी चुनें',
          'add_product_screen.enter_price': 'कीमत दर्ज करें',
          'add_product_screen.enter_quantity': 'मात्रा दर्ज करें',
          'add_product_screen.enter_expiry_date': 'समाप्ति तिथि दर्ज करें',
          'add_product_screen.enter_days': 'दिन दर्ज करें',
          'add_product_screen.enter_discount': 'छूट दर्ज करें',
          'add_product_screen.no_categories_available':
              'कोई श्रेणियाँ उपलब्ध नहीं',
          'add_product_screen.retry': 'पुनः प्रयास करें',
          'add_product_screen.save': 'सहेजें',
          'add_product_screen.error_select_category': 'कृपया एक श्रेणी चुनें',
          'add_product_screen.success_message': 'उत्पाद सफलतापूर्वक जोड़ा गया',
          'add_product_screen.error_message': 'उत्पाद जोड़ने में विफल',
          // AddCategoryScreen
          'add_category_screen.title': 'श्रेणी जोड़ें',
          'add_category_screen.item_name': 'आइटम का नाम',
          'add_category_screen.upload_image':
              'छवि अपलोड करें', // Corrected typo
          'add_category_screen.add_product': 'उत्पाद जोड़ें',
          'add_category_screen.enter_email': 'ईमेल दर्ज करें',
          'add_category_screen.invalid_email': 'एक वैध ईमेल पता दर्ज करें',
          'add_category_screen.save': 'सहेजें',
          // ProfileScreen
          'profile_screen.edit_profile': 'प्रोफाइल संपादित करें',
          'profile_screen.edit_shop': 'दुकान संपादित करें',
          'profile_screen.bank_details': 'बैंक विवरण',
          'profile_screen.widthdraw': 'निकासी', // Corrected typo
          'profile_screen.connect_account': 'खाता जोड़ें',
          'profile_screen.settings': 'सेटिंग्स',
          'profile_screen.notification': 'सूचना',
          'profile_screen.change_password': 'पासवर्ड बदलें',
          'profile_screen.language': 'भाषा',
          'profile_screen.support': 'समर्थन',
          'profile_screen.policies': 'नीतियाँ',
          'profile_screen.about_us': 'हमारे बारे में',
          'profile_screen.logout': 'लॉगआउट',
          'profile_screen.error_profile_not_available':
              'प्रोफाइल डेटा उपलब्ध नहीं',
          'profile_screen.error_shop_not_available': 'दुकान डेटा उपलब्ध नहीं',
          'profile_screen.error_link_not_available': 'लिंक उपलब्ध नहीं',
          // EditProfileScreen
          'edit_profile.title': 'प्रोफाइल संपादित करें',
          'edit_profile.name': 'नाम',
          'edit_profile.email_address': 'ईमेल पता',
          'edit_profile.contact_information': 'संपर्क जानकारी',
          'edit_profile.address': 'पता',
          'edit_profile.city': 'शहर',
          'edit_profile.state': 'राज्य',
          'edit_profile.zipcode': 'ज़िप कोड',
          'edit_profile.country': 'देश',
          'edit_profile.shop_name': 'दुकान का नाम',
          'edit_profile.description': 'विवरण',
          'edit_profile.enter_name': 'कृपया नाम दर्ज करें',
          'edit_profile.enter_contact_information':
              'कृपया संपर्क जानकारी दर्ज करें',
          'edit_profile.enter_address': 'कृपया पता दर्ज करें',
          'edit_profile.enter_city': 'कृपया शहर दर्ज करें',
          'edit_profile.enter_state': 'कृपया राज्य दर्ज करें',
          'edit_profile.enter_zipcode': 'कृपया ज़िप कोड दर्ज करें',
          'edit_profile.enter_country': 'कृपया देश दर्ज करें',
          'edit_profile.enter_shop_name': 'कृपया दुकान का नाम दर्ज करें',
          'edit_profile.enter_description': 'कृपया विवरण दर्ज करें',
          'edit_profile.success_message': 'प्रोफाइल सफलतापूर्वक अपडेट की गई',
          'edit_profile.error_message': 'प्रोफाइल अपडेट करने में विफल',

          // InfoScreen
          'info_screen.no_data_available': 'कोई डेटा उपलब्ध नहीं',
          'info_screen.error_loading_data': 'डेटा लोड करने में त्रुटि',
           'info_screen.about_us': 'हमारे बारे में',
          // EditShopScreen
          'edit_shop_screen.title': 'दुकान अपडेट करें',
          'edit_shop_screen.shop_name': 'दुकान का नाम',
          'edit_shop_screen.description': 'विवरण',
          'edit_shop_screen.address': 'पता',
          'edit_shop_screen.enter_shop_name': 'कृपया दुकान का नाम दर्ज करें',
          'edit_shop_screen.enter_description': 'कृपया विवरण दर्ज करें',
          'edit_shop_screen.enter_address': 'कृपया पता दर्ज करें',
          'edit_shop_screen.success_message': 'दुकान अपडेट की गई',
          'edit_shop_screen.error_message': 'दुकान अपडेट करने में विफल',
          // ChangePasswordScreen
          'change_password_screen.title': 'पासवर्ड बदलें',
          'change_password_screen.current_password': 'वर्तमान पासवर्ड',
          'change_password_screen.new_password': 'नया पासवर्ड',
          'change_password_screen.confirm_password': 'पासवर्ड की पुष्टि करें',
          'change_password_screen.enter_password': 'पासवर्ड दर्ज करें',
          'change_password_screen.success_message':
              'पासवर्ड परिवर्तन सफलतापूर्वक हो गया',
          'change_password_screen.error_message': 'पासवर्ड बदलने में विफल',
          // WidthdrawScreen
          'widthdraw_screen.title': 'कमाई',
          'widthdraw_screen.your_balance': 'आपका शेष',
          'widthdraw_screen.withdraw': 'निकासी',
          'widthdraw_screen.no_withdrawal_details':
              'कोई निकासी विवरण उपलब्ध नहीं',
          'widthdraw_screen.withdraw_id': 'निकासी आईडी',
          'widthdraw_screen.amount': 'राशि',
          'widthdraw_screen.status': 'स्थिति',
          'widthdraw_screen.date': 'तारीख',
          'widthdraw_screen.details': 'विवरण',
          // WidthdrawRequestScreen
          'widthdraw_request_screen.title': 'निकासी अनुरोध',
          'widthdraw_request_screen.amount': 'राशि',
          'widthdraw_request_screen.enter_amount': 'राशि दर्ज करें',
          'widthdraw_request_screen.submit_request': 'अनुरोध सबमिट करें',
          'widthdraw_request_screen.success_message':
              'निकासी सफलतापूर्वक हो गई',
          'widthdraw_request_screen.error_message':
              'निकासी अनुरोध सबमिट करने में विफल',
        },
      };
}
