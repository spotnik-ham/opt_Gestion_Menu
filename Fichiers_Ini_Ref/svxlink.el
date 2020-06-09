[GLOBAL]
LOGICS=SimplexLogic
CFG_DIR=svxlink.d
TIMESTAMP_FORMAT=%c
CARD_SAMPLE_RATE=16000
CARD_CHANNELS=1
STATE_PTY=/tmp/state_pty

[SimplexLogic]
TYPE=Simplex
RX=Rx1
TX=Tx1
MODULES=ModuleHelp,ModuleMetarInfo,ModulePropagationMonitor,ModuleEchoLink
CALLSIGN=indicatif
LONG_IDENT_INTERVAL=60
SHORT_IDENT_INTERVAL=15
IDENT_ONLY_AFTER_TX=10
EXEC_CMD_ON_SQL_CLOSE=500
EVENT_HANDLER=/usr/share/svxlink/events.tcl
DEFAULT_LANG=fr_FR
RGR_SOUND_DELAY=0
REPORT_CTCSS=71.9
TX_CTCSS=ALWAYS
FX_GAIN_NORMAL=0
FX_GAIN_LOW=-12
ACTIVATE_MODULE_ON_LONG_CMD=2:EcholInk
MUTE_RX_ON_TX=1
DTMF_CTRL_PTY=/tmp/dtmf_uhf

[Rx1]
TYPE=Local
AUDIO_DEV=alsa:plughw:1
AUDIO_CHANNEL=0
SQL_DET=GPIO
SQL_START_DELAY=500
SQL_DELAY=100
SQL_HANGTIME=15
SQL_EXTENDED_HANGTIME=1000
SQL_EXTENDED_HANGTIME_THRESH=13
SQL_TIMEOUT=600
VOX_FILTER_DEPTH=300
VOX_THRESH=1000
CTCSS_MODE=2
CTCSS_FQ=71.9
CTCSS_SNR_OFFSET=0
CTCSS_OPEN_THRESH=15
CTCSS_CLOSE_THRESH=9
CTCSS_BPF_LOW=60
CTCSS_BPF_HIGH=260
GPIO_PATH=/sys/class/gpio
GPIO_SQL_PIN=gpio10
DEEMPHASIS=0
SQL_TAIL_ELIM=0
PREAMP=-4
PEAK_METER=1
DTMF_DEC_TYPE=INTERNAL
DTMF_MUTING=1
DTMF_HANGTIME=40
1750_MUTING=1

[Tx1]
TYPE=Local
AUDIO_DEV=alsa:plughw:1
AUDIO_CHANNEL=0
PTT_TYPE=GPIO
GPIO_PATH=/sys/class/gpio
PTT_PIN=gpio7
TIMEOUT=300
TX_DELAY=20
PREAMP=0
PREEMPHASIS=0
DTMF_TONE_LENGTH=100
DTMF_TONE_SPACING=50
DTMF_DIGIT_PWR=-15

[LocationInfo]
APRS_SERVER_LIST=euro.aprs2.net:14580
LON_POSITION=3.23.44W
LAT_POSITION=48.32.37N
CALLSIGN=EL-indicatif
FREQUENCY=434.975
TX_POWER=3
ANTENNA_GAIN=1
ANTENNA_HEIGHT=4m
ANTENNA_DIR=-1
PATH=WIDE1-1
BEACON_INTERVAL=10
TONE=71
COMMENT=>>> SpotNik V4.0 <<<<<
