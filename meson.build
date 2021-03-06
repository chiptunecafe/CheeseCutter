project('cheesecutter', 'd', 'c', 'cpp', version: '2.10-CC-WIP', default_options: ['buildtype=debugoptimized', 'cpp_std=c++11'])
add_project_link_arguments(['-lstdc++'], language: ['cpp', 'd'])

# ccutter D sources
main_sources = [
    'src/derelict/util/compat.d',
    'src/derelict/util/sharedlib.d',
    'src/derelict/util/exception.d',
    'src/derelict/util/loader.d',
    'src/derelict/util/wintypes.d',
    'src/derelict/util/xtypes.d',
    'src/derelict/sdl/sdl.d',
    'src/derelict/sdl/net.d',
    'src/derelict/sdl/ttf.d',
    'src/derelict/sdl/mixer.d',
    'src/derelict/sdl/image.d',
    'src/derelict/sdl/sdlfuncs.d',
    'src/derelict/sdl/sdltypes.d',
    'src/derelict/sdl/macinit/CoreFoundation.d',
    'src/derelict/sdl/macinit/DerelictSDLMacLoader.d',
    'src/derelict/sdl/macinit/ID.d',
    'src/derelict/sdl/macinit/MacTypes.d',
    'src/derelict/sdl/macinit/NSApplication.d',
    'src/derelict/sdl/macinit/NSArray.d',
    'src/derelict/sdl/macinit/NSAutoreleasePool.d',
    'src/derelict/sdl/macinit/NSDictionary.d',
    'src/derelict/sdl/macinit/NSEnumerator.d',
    'src/derelict/sdl/macinit/NSEvent.d',
    'src/derelict/sdl/macinit/NSGeometry.d',
    'src/derelict/sdl/macinit/NSMenu.d',
    'src/derelict/sdl/macinit/NSMenuItem.d',
    'src/derelict/sdl/macinit/NSNotification.d',
    'src/derelict/sdl/macinit/NSObject.d',
    'src/derelict/sdl/macinit/NSProcessInfo.d',
    'src/derelict/sdl/macinit/NSString.d',
    'src/derelict/sdl/macinit/NSZone.d',
    'src/derelict/sdl/macinit/runtime.d',
    'src/derelict/sdl/macinit/SDLMain.d',
    'src/derelict/sdl/macinit/selectors.d',
    'src/derelict/sdl/macinit/string.d',
    'src/main.d',
    'src/audio/audio.d',
    'src/audio/player.d',
    'src/audio/timer.d',
    'src/audio/callback.d',
    'src/ct/purge.d',
    'src/ct/base.d',
    'src/ct/dump.d',
    'src/com/fb.d',
    'src/com/cpu.d',
    'src/com/kbd.d',
    'src/com/session.d',
    'src/com/util.d',
    'src/ui/tables.d',
    'src/ui/dialogs.d',
    'src/ui/ui.d',
    'src/ui/input.d',
    'src/ui/help.d',
    'src/seq/seqtable.d',
    'src/seq/tracktable.d',
    'src/seq/trackmap.d',
    'src/seq/fplay.d',
    'src/seq/sequencer.d',
    'src/audio/resid/filter.d'
]

# ccutter C++ sources
main_sources += [
    'src/audio/resid/residctrl.cpp',
    'src/resid/envelope.cpp',
    'src/resid/extfilt.cpp',
    'src/resid/filter.cpp',
    'src/resid/w6_ps_.cpp',
    'src/resid/w6_pst.cpp',
    'src/resid/w6_p_t.cpp',
    'src/resid/w6__st.cpp',
    'src/resid/w8_ps_.cpp',
    'src/resid/w8_pst.cpp',
    'src/resid/w8_p_t.cpp',
    'src/resid/w8__st.cpp',
    'src/resid/pot.cpp',
    'src/resid/sid.cpp',
    'src/resid/voice.cpp',
    'src/resid/wave.cpp',
    'src/resid-fp/Dac.cpp',
    'src/resid-fp/EnvelopeGenerator.cpp',
    'src/resid-fp/ExternalFilter.cpp',
    'src/resid-fp/Filter.cpp',
    'src/resid-fp/Filter6581.cpp',
    'src/resid-fp/Filter8580.cpp',
    'src/resid-fp/FilterModelConfig.cpp',
    'src/resid-fp/FilterModelConfig8580.cpp',
    'src/resid-fp/Integrator.cpp',
    'src/resid-fp/Integrator8580.cpp',
    'src/resid-fp/OpAmp.cpp',
    'src/resid-fp/SID.cpp',
    'src/resid-fp/Spline.cpp',
    'src/resid-fp/WaveformCalculator.cpp',
    'src/resid-fp/WaveformGenerator.cpp',
    'src/resid-fp/resample/SincResampler.cpp'
]

# ct2util D sources
util_sources = [
    'src/ct2util.d',
    'src/ct/base.d',
    'src/com/cpu.d',
    'src/com/util.d',
    'src/ct/purge.d',
    'src/ct/dump.d',
    'src/ct/build.d'
]

# ct2util C sources
util_sources += [
    'src/asm/acme.c',
    'src/asm/alu.c',
    'src/asm/basics.c',
    'src/asm/cpu.c',
    'src/asm/dynabuf.c',
    'src/asm/encoding.c',
    'src/asm/flow.c',
    'src/asm/global.c',
    'src/asm/input.c',
    'src/asm/label.c',
    'src/asm/macro.c',
    'src/asm/mnemo.c',
    'src/asm/output.c',
    'src/asm/platform.c',
    'src/asm/section.c',
    'src/asm/tree.c'
]

# residfp configuration
cpp_compiler = meson.get_compiler('cpp')
have_builtin_expect = cpp_compiler.compiles('int main() { __builtin_expect(0, 0); }', name: '__builtin_expect')

siddefs_fp = configuration_data()
siddefs_fp.set10('RESID_BRANCH_HINTS', get_option('resid_branch_hints'))
siddefs_fp.set10('HAVE_BUILTIN_EXPECT', have_builtin_expect)
if get_option('resid_inline')
    siddefs_fp.set('RESID_INLINE', 'inline')
    siddefs_fp.set('RESID_INLINING', '1')
else
    siddefs_fp.set('RESID_INLINE', '')
    siddefs_fp.set('RESID_INLINING', '0')
endif

configure_file(input: 'src/resid-fp/siddefs-fp.h.in', output: 'siddefs-fp.h', configuration: siddefs_fp)
configure_file(input: 'src/resid-fp/sidcxx11.h.in', output: 'sidcxx11.h', configuration: { 'HAVE_CXX11': 1 }) # TODO maybe detect

executable('ccutter', main_sources, include_directories: 'src', link_language: 'd', d_import_dirs: include_directories('src/c64', 'src/font'), install:true)
executable('ct2util', util_sources, include_directories: 'src', link_language: 'd', d_import_dirs: include_directories('src/c64', 'src/font'), install: true)

install_subdir('tunes', install_dir: 'share/ccutter')
install_man('doc/ccutter.1', 'doc/ccutter.fr.1', 'doc/ct2util.1', 'doc/ct2util.fr.1')

if target_machine.system() == 'windows'
    configure_file(input: 'arch/Win32/SDL.dll', output: 'SDL.dll', copy: true)
    install_data('arch/Win32/SDL.dll', install_dir: get_option('bindir'))
endif
