	.text
	.file	"add.c"
	.globaltype	__stack_pointer, i32
	.functype	malloc2 (i32) -> (i32)
	.functype	free (i32) -> ()
	.functype	add (i32, i32) -> (i32)
	.functype	sum (i32, i32) -> (i32)
	.section	.text.malloc2,"",@
	.hidden	malloc2                         # -- Begin function malloc2
	.globl	malloc2
	.type	malloc2,@function
malloc2:                                # @malloc2
	.functype	malloc2 (i32) -> (i32)
	.local  	i32
# %bb.0:
	global.get	__stack_pointer
	i32.const	16
	i32.sub 
	local.tee	1
	local.get	0
	i32.store	12
	local.get	1
	i32.const	0
	i32.load	bump_pointer
	i32.store	8
	i32.const	0
	i32.const	0
	i32.load	bump_pointer
	local.get	1
	i32.load	12
	i32.add 
	i32.store	bump_pointer
	local.get	1
	i32.load	8
                                        # fallthrough-return
	end_function
                                        # -- End function
	.section	.text.free,"",@
	.hidden	free                            # -- Begin function free
	.globl	free
	.type	free,@function
free:                                   # @free
	.functype	free (i32) -> ()
# %bb.0:
	global.get	__stack_pointer
	i32.const	16
	i32.sub 
	local.get	0
	i32.store	12
                                        # fallthrough-return
	end_function
                                        # -- End function
	.section	.text.add,"",@
	.hidden	add                             # -- Begin function add
	.globl	add
	.type	add,@function
add:                                    # @add
	.functype	add (i32, i32) -> (i32)
	.local  	i32
# %bb.0:
	global.get	__stack_pointer
	i32.const	16
	i32.sub 
	local.tee	2
	local.get	0
	i32.store	12
	local.get	2
	local.get	1
	i32.store	8
	local.get	2
	i32.load	12
	local.get	2
	i32.load	12
	i32.mul 
	local.get	2
	i32.load	8
	i32.add 
                                        # fallthrough-return
	end_function
                                        # -- End function
	.section	.text.sum,"",@
	.hidden	sum                             # -- Begin function sum
	.globl	sum
	.type	sum,@function
sum:                                    # @sum
	.functype	sum (i32, i32) -> (i32)
	.local  	i32
# %bb.0:
	global.get	__stack_pointer
	i32.const	16
	i32.sub 
	local.tee	2
	local.get	0
	i32.store	12
	local.get	2
	local.get	1
	i32.store	8
	local.get	2
	i32.const	0
	i32.store	4
	local.get	2
	i32.const	0
	i32.store	0
.LBB3_1:                                # =>This Inner Loop Header: Depth=1
	block   	
	loop    	                                # label1:
	local.get	2
	i32.load	0
	local.get	2
	i32.load	8
	i32.lt_s
	i32.const	1
	i32.and 
	i32.eqz
	br_if   	1                               # 1: down to label0
# %bb.2:                                #   in Loop: Header=BB3_1 Depth=1
	local.get	2
	local.get	2
	i32.load	4
	local.get	2
	i32.load	12
	local.get	2
	i32.load	0
	i32.const	2
	i32.shl 
	i32.add 
	i32.load	0
	i32.add 
	i32.store	4
# %bb.3:                                #   in Loop: Header=BB3_1 Depth=1
	local.get	2
	local.get	2
	i32.load	0
	i32.const	1
	i32.add 
	i32.store	0
	br      	0                               # 0: up to label1
.LBB3_4:
	end_loop
	end_block                               # label0:
	local.get	2
	i32.load	4
                                        # fallthrough-return
	end_function
                                        # -- End function
	.hidden	bump_pointer                    # @bump_pointer
	.type	bump_pointer,@object
	.section	.data.bump_pointer,"",@
	.globl	bump_pointer
	.p2align	2, 0x0
bump_pointer:
	.int32	__heap_base
	.size	bump_pointer, 4

	.ident	"clang version 18.1.8"
	.size	__heap_base, 1
	.section	.custom_section.producers,"",@
	.int8	1
	.int8	12
	.ascii	"processed-by"
	.int8	1
	.int8	5
	.ascii	"clang"
	.int8	6
	.ascii	"18.1.8"
	.section	.data.bump_pointer,"",@
	.section	.custom_section.target_features,"",@
	.int8	2
	.int8	43
	.int8	15
	.ascii	"mutable-globals"
	.int8	43
	.int8	8
	.ascii	"sign-ext"
	.section	.data.bump_pointer,"",@
