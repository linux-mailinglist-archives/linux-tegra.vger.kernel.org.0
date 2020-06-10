Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB6F11F4A72
	for <lists+linux-tegra@lfdr.de>; Wed, 10 Jun 2020 02:50:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726021AbgFJAuH (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 9 Jun 2020 20:50:07 -0400
Received: from sonic304-21.consmr.mail.sg3.yahoo.com ([106.10.242.211]:45687
        "EHLO sonic304-21.consmr.mail.sg3.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726068AbgFJAuG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 9 Jun 2020 20:50:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1591750204; bh=fWjln6K44Eskt5xJ54p36XH05v6HgNA/YUSUPVdtmXQ=; h=Date:From:Reply-To:Subject:References:From:Subject; b=WOPJaid30h2v9RATv424yfzwLCLka3FbSw/YyHjoN4KMPzVe6JdxnjCqRlThXI5+ZivPjyzpjBvDY4LsDjzgHmzkQRDaSeZG7qbIWYVFxzA+7pOPz8GBdRrBvUJ1vBT6o/bj2k0B6Lf1TZC2UlxhGmEYABQYH6xNKm+iAqT93R52VxWVTgIKLvfjXj6jRjcrwMneFYzpUCYbXja6ycx2512QlVWPRlwhycMy/b5otjppEt0dHBEKo8JoudZQ3JrZ7fn4pCQtvbIshWT1O+ErZeh5d9GtqS7aoc4Cs55JxoLfrVCukrSz+hpEkrsbHgc+ub7KCAAyj9FPiwQaisOioA==
X-YMail-OSG: ayoPSMUVM1lsFbGqyloV.iY8f_b9waQKDn20uSMtDmNgyGJcHHqnCnQkcltU8mf
 Rjj2oZgcVsIOEvVXPpbzjkxTWTrwDWL1.6iTgfmFWun1N.s5f7e4Fzrlbda6MHbA0a.gkP_emgH9
 rpJAqYuiRxWupS0c9Zx8WnkdDgFVJUrLTLE0hVLbBdpVUAJB5FLdlApCnQ31Xc2LDNMPe7ylmTTa
 3X6TOuFnJvOVsE1UYRUXfj_Hc8l7TkWyxdbpz2tAbCTfeF43areHBJgRAky529.GZbQhypA8Uqoe
 byXQTYUAAajRPn4H52aA_xXjXGM52ZIT.udKUhp4MD7_8rOlEMPGC_F1ApCfx9rihNGnDC4ZtzGj
 na3odQN3E3UbJ4_vNngKwEh4lSj9puBS9CWrqxZS_a0tvNUhGk8GXsrf4ydlOqEe9CZ74Bo0dI1o
 x5ANw4vCNTGQSKDNd27udZXUMkQj_OceTzTw2xnc3RnKZytoHuVpCdaHxmUG8Wz8kA3oeP8JmCBl
 e5OFqSRjoPtSQADyNGQSUR2z5diuKNlJVrx_HNsTT5I66PNNea4Z0ndRCU_LpH4r88Dhh4qlxl2_
 EcoNyZXXwFxZfcvOi.jQvTI6WX3h3hc5rKtpXdKSwx5z4ZUGX8IPvwXvw9H_i32tXSeLSam5CJmd
 rXPJbKdy5P6zzMrVxxgRe5HJ7HrGDw7C__hVgdLQK1zp4wMqtG7VOMeBjhwFmdWrtgN.DFT9j00e
 M_O1Cvhls1tx6QpisqM2.9z9SSPk3mE0EtzArDPvdCRqM4KUu16clrKjkNoydcJQwuhldSOU2M22
 qLhqF7SjKYnMmaKNfW77kFgDWAhFI51fzB2GzInX.DBd1LaPM8_Hd513V40lB2m_Ev6s7dDt_rHV
 GVAwFHZotetPGlpYjg.uZnRj3a2_U3MuGB5E.o4p6rnXmQ_n8ucvzepvO5MHACUTFy5B36_.O4Db
 FfJbmuDtWzO5Ftx4YldP7Lq2RemMx4Sz90BbSQmb9Ds_zDUSD.86FZW4I6utqBRdBeY1gc91.5Hx
 unTFDZ5OSo9EbO3rgywd_hnkZPaAKTJnrP8g5oqsuoLUKn0QwXPfX4laYz6LvhvmDgaml3WYXrH9
 BOkTsGdAYoRHqb1xhA4AAMZMT1Ic5JaP5urcQu6Ss_VfbqrDoxC7ieWx49gor65btxJD1IOObSGh
 6y4CR0Q0AQQ0ON1JwYkel7hSIo10ScqTW5LCgtqPdjU_W.WC4_bxsZkMsjz7Hw0cMbyQgAfa.USz
 0ehzKW_GnAAOzuhqs7BDPCLhIoChOjH6O1bFIySJeGivR.GU3tGbJ_7rKR5tZPd0m3uToFHAVpo_
 wdNG6HBryxiy1c7v1bJTDz7bf
Received: from sonic.gate.mail.ne1.yahoo.com by sonic304.consmr.mail.sg3.yahoo.com with HTTP; Wed, 10 Jun 2020 00:50:04 +0000
Date:   Wed, 10 Jun 2020 00:50:00 +0000 (UTC)
From:   Celine Marchand <info.fsvt@usa.com>
Reply-To: celine88492@gmail.com
Message-ID: <1327230475.528260.1591750200327@mail.yahoo.com>
Subject: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <1327230475.528260.1591750200327.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16072 YMailNodin Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



Urgent attention please
Dearest, how are you? I am sorry for intruding your mailbox, but I need to =
talk to you. I got your email address in my dream and i wonder if it is cor=
rect because i emailed you earlier without any response. You should know th=
at my contact to you is by the special grace of God. I am in urgent need of=
 a reliable and reputable person and i believe you are a person of fine rep=
ute, hence the revelation of your email to me in the dream.
I am Mrs. Celine Marchand a citizen of France (French). But reside in Burki=
na Faso for business purposes. I need your collaboration to execute some pr=
ojects worth =E2=82=AC 2.800.000 Euro and it is very urgent as am presently=
 in very critical condition.
Please reply through this email address ( celine88492@gmail.com ) with your=
 full contact information for more private and confidential communication.

Thank you as i wait for your reply.
Mrs. Celine Marchand
