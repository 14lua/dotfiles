---------------
---- INPUT ----
---------------

hl.config({
  input = {
    kb_layout    = "de",
    kb_variant   = "neo_qwertz",
    repeat_delay = 200,

    follow_mouse = 1,

    sensitivity  = 0, -- -1.0 - 1.0, 0 means no modification.

    touchpad     = {
      natural_scroll = true,
    },
  },
})

hl.gesture({
  fingers = 3,
  direction = "horizontal",
  action = "workspace"
})
