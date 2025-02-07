;; Capture exported classes, methods, variables, enums, and other Dart definitions

;; Classes and their members
(class_declaration
  name: (identifier) @class
  body: (class_body
    (method_declaration) @method
    (field_declaration) @class_variable
    (constructor_declaration) @method
    (getter_signature) @method
    (setter_signature) @method
  )
) @class

;; Enums and their values
(enum_declaration
  name: (identifier) @enum
  body: (enum_body
    (enum_constant_declaration) @enum_item
  )
) @enum

;; Top-level functions
(function_declaration
  name: (identifier) @function
) @function

;; Arrow functions
(variable_declaration
  (variable_declarator
    name: (identifier) @variable
    value: (arrow_function) @function
  )
) @function

;; Variables and constants
(variable_declaration
  (variable_declarator
    name: (identifier) @variable
    value: (expression) @variable
  )
) @variable

(static_field_declaration
  (variable_declaration_list
    (variable_declaration
      name: (identifier) @class_variable
    )
  )
) @class_variable

(const_field_declaration
  (variable_declaration_list
    (variable_declaration
      name: (identifier) @class_variable
    )
  )
) @class_variable

;; Mixins
(mixin_declaration
  name: (identifier) @class
  body: (mixin_body
    (method_declaration) @method
    (field_declaration) @class_variable
  )
) @class

;; Extensions
(extension_declaration
  name: (identifier)? @extension
  on_type: (type) @extension_on
  body: (extension_body
    (method_declaration) @method
    (field_declaration) @class_variable
  )
) @extension

;; Abstract classes
(abstract_class_declaration
  name: (identifier) @class
  body: (class_body
    (method_declaration) @method
    (field_declaration) @class_variable
  )
) @class

