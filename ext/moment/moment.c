#include <stdlib.h>
#include <ruby.h>

// rb_require("datetime");

static VALUE rb_mWrapCExample;
static VALUE rb_cMoment;

static VALUE
parse_date_time_string_c(VALUE self, VALUE ruby_str) {

  /*
   * Setup for function located in ../../static_libs/hello_user.c
   */
  // char *  greeting(char *);
  double parseDateTimeString(const char *str);

  const char* name = RSTRING_PTR(ruby_str);
  /*
   * return a string VALUE from a char * that ruby can handle and assign to variables rb_iv_get(self, "@name")
   */
  VALUE t = rb_float_new(parseDateTimeString(name));
  return t;
  // ID sym_mymodule = rb_intern("DateTime");
  // ID sym_strptime = rb_intern("puts");
  // VALUE DateTime = rb_const_get(rb_cObject, rb_intern("DateTime"));
  // VALUE result = rb_funcall(DateTime, sym_strptime, 2, rb_str_new2(t), rb_str_new2("%s"));

//   int state;
// 	VALUE result;
// 	result = rb_eval_string_protect("DateTime.strptime('".StringValue(t)."'}', '%s')", &state);
// 	// printf("%s\n", rb_any_to_s(result));
// 	ID sym_puts = rb_intern("puts");
// // Call puts, from Kernel
// 	rb_funcall(rb_mKernel, sym_puts, 1, rb_str_new2("Hello world!"));
	// return rb_inspect(result);
	// // if (state)
	// // {

	// // }
 //  // return DateTime.strptime(t, "%s");
	// return result;
}

// static VALUE
// greeting_init(VALUE self, VALUE name) {
//   rb_iv_set(self, "@name", name);

//   return self;
// }

void
Init_moment() {
  // rb_mWrapCExample = rb_define_module("WrapCExample");
  rb_eval_string("require 'date'");	
  rb_cMoment     = rb_define_class("Moment", rb_cObject);

  rb_define_method(rb_cMoment, "parse_date_time_string", parse_date_time_string_c, 1);
  // rb_define_method(rb_cGreeting, "initialize", greeting_init, 1);
  // rb_define_method(rb_cGreeting, "hello", greeting_hello, 0);
}