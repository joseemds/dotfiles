;; inherits: ocaml
;; extends

(value_definition
  (let_binding
		pattern: (_)
		(parameter)+ @parameter.outer
    body: (_) @function.inner
	)) @function.outer

(parameter) @parameter.inner

(module_definition (_) @class.inner) @class.outer

(value_definition
(let_binding
	pattern: (_) @assignment.lhs
	.
	body: (_) @assignment.rhs
	) @assignment.inner) @assignment.outer

