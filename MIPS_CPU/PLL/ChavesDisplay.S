#define SegEn_ADDR    0x80001038
#define SegDig_ADDR   0x8000103C

.globl main
main:
    li t0, 0x80001400   # base address of GPIO memory-mapped registers
    li t1, 0xFFFF       # set direction of GPIOs
                        # upper half = switches (inputs)  (=0)
                        # lower half = outputs (LEDs)     (=1)
    sw t1, 8(t0)        # GPIO_INOUT = 0xFFFF

    li t1, SegEn_ADDR
    li t6, 0xF0
    sb t6, 0(t1)		# Enable the 7SegDisplays

next:
    li t0, 0x80001400
    lw   t1, 0(t0)      # read switches: t1 = GPIO_SWs
    srli t6, t1, 16     # shift val to the right by 16 bits

    li t1, SegDig_ADDR
    sw t6, 0(t1)		# Write the 7SegDisplays

	beq zero, zero, next

.end