import html
import random
import KomiRobot.modules.truth_and_dare_string as truth_and_dare_string
from KomiRobot import dispatcher
from telegram import ParseMode, Update, Bot
from KomiRobot.modules.disable import DisableAbleCommandHandler
from telegram.ext import CallbackContext, run_async


def truth(update: Update, context: CallbackContext):
    args = context.args
    update.effective_message.reply_text(random.choice(truth_and_dare_string.TRUTH))


def dare(update: Update, context: CallbackContext):
    args = context.args
    update.effective_message.reply_text(random.choice(truth_and_dare_string.DARE))
    
def sigma(update: Update, context: CallbackContext):
    update.effective_message.reply_video(random.choice(truth_and_dare_string.SIGMA))


BOTLIST = """
✪Komi Scanner currently pushes bans to the following bots.
Connected Gbans:

╔• [shouko komi](https://t.me/komiXrobot)
╠• [lelouch ZΞ℞Ø](https://t.me/LelouchXRobot)
╠• [Ichigo Sin](https://t.me/Ichigoxbot)
╠• [Power pro ](https://t.me/PowerDevilHunterBot)
╠• [Komi - San](https://t.me/KomiXryu_bot)
╠• [Kurama kur](https://t.me/Kurama9T_Bot)
╚• [Nobara Bot](https://t.me/@Nobara_Superbot)

✪ Appeal Chat: @KomiXsupport
"""

def botlist(update: Update, context: CallbackContext):
    update.effective_message.reply_text((BOTLIST),
    parse_mode=ParseMode.MARKDWON
            )

TRUTH_HANDLER = DisableAbleCommandHandler("truth", truth, run_async=True)
DARE_HANDLER = DisableAbleCommandHandler("dare", dare, run_async=True)
SIGMA_HANDLER = DisableAbleCommandHandler("sigma", sigma, run_async=True)
BOTLIST_HANDLER = DisableAbleCommandHandler("bots", botlist, run_async=True)

dispatcher.add_handler(TRUTH_HANDLER)
dispatcher.add_handler(DARE_HANDLER)
dispatcher.add_handler(SIGMA_HANDLER)
dispatcher.add_handler(BOTLIST_HANDLER)

__mod_name__ = "FUN RULES"

__help__ = """
 - `/truth` : for a truth
 - `/dare` : for a dare
 - `/Sigma` : for a Sigma rules
 
"""



