from platform import python_version as y
from telegram import __version__ as o
from pyrogram import __version__ as z
from telethon import __version__ as s
from pyrogram.types import Message, InlineKeyboardMarkup, InlineKeyboardButton
from pyrogram import filters
from KomiRobot import pbot
from KomiRobot.utils.errors import capture_err

MEMEK = "https://te.legra.ph/file/a7fb554556e7a024fb5e7.jpg"

@pbot.on_message(filters.command("repo"))
async def repo(_, message):
    await message.reply_photo(
        photo=MEMEK,
        caption=f""" **Ore no Shouko komi desu**  

**Owner repo : [Blank](https://t.me/Girl_lob)**
**Python Version :** `{y()}`
**Library Version :** `{o}`
**Telethon Version :** `{s}`
**Pyrogram Version :** `{z}`

**Talk to Boss Of Bonten.**
""",
        reply_markup=InlineKeyboardMarkup(
            [
                [
                    InlineKeyboardButton(
                        "Owner", url="https://t.me/girl_lob"), 
                    InlineKeyboardButton(
                        "Support", url="https://t.me/komiXsupport")
                ]
            ]
        )
    )
