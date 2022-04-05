Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A2FF4F2328
	for <lists+linux-tegra@lfdr.de>; Tue,  5 Apr 2022 08:33:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229979AbiDEGfL (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 5 Apr 2022 02:35:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229892AbiDEGfH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 5 Apr 2022 02:35:07 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBCCB33E04;
        Mon,  4 Apr 2022 23:33:09 -0700 (PDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out2.suse.de (Postfix) with ESMTP id A823B1F38A;
        Tue,  5 Apr 2022 06:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1649140388; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=JcfhvICtJKCeKtW0oDjbSh0bSoohtfR7AsJWT9Fe+Qk=;
        b=TCf1NmCD9p71no+4W81Ap0MxKs2S06umdVz2r7Ctc5x/gVLAFQQL7/Ir+p1587/+0lbhQn
        ciAUmhG5gz66/BH5CWz8y+scggh8LZoejV3OBaUvLtng80XsaW1CEh1PjPvpfmYGdLWqDJ
        dHHbxZOUrUcRcEJ1KLlwe2Zen2IIH5A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1649140388;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=JcfhvICtJKCeKtW0oDjbSh0bSoohtfR7AsJWT9Fe+Qk=;
        b=x+47IxFd44rN4kifJgGsO/zhoXSz8FiCMndz9YlJNs2QSun4oAkhMhu27773xlrnWC/j3+
        qyI6WMuT3vNwLpCg==
Received: from alsa1.suse.de (alsa1.suse.de [10.160.4.42])
        by relay2.suse.de (Postfix) with ESMTP id 90777A3B82;
        Tue,  5 Apr 2022 06:33:08 +0000 (UTC)
Date:   Tue, 05 Apr 2022 08:33:08 +0200
Message-ID: <s5hee2c82fv.wl-tiwai@suse.de>
From:   Takashi Iwai <tiwai@suse.de>
To:     Mohan Kumar D <mkumard@nvidia.com>
Cc:     tiwai@suse.com, perex@perex.cz, thierry.reding@gmail.com,
        jonathanh@nvidia.com, spujar@nvidia.com,
        alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/tegra: Fix hda Jack detection
In-Reply-To: <a6964809-ad10-aca8-0776-011c9e6b318d@nvidia.com>
References: <20220405032607.8489-1-mkumard@nvidia.com>
        <s5hfsms843u.wl-tiwai@suse.de>
        <a6964809-ad10-aca8-0776-011c9e6b318d@nvidia.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI/1.14.6 (Maruoka)
 FLIM/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL/10.8 Emacs/25.3
 (x86_64-suse-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI 1.14.6 - "Maruoka")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 05 Apr 2022 08:05:03 +0200,
Mohan Kumar D wrote:
> 
> 
> On 4/5/2022 11:27 AM, Takashi Iwai wrote:
> > External email: Use caution opening links or attachments
> >
> >
> > On Tue, 05 Apr 2022 05:26:07 +0200,
> > Mohan Kumar wrote:
> >> Tegra HDA Jack detection logic doesn't work when the HDACODEC
> >> in runtime suspended state as unsol event won't be triggered
> >> during D3 state. As pulseaudio server in userspace rely on the
> >> jack mixer control status to show the audio devices in gui and
> >> any display sink device hotplug event during D3 state will never
> >> updates the jack status which will result in no audio device option
> >> available in userspace settings.
> >>
> >> The possible option available to resolve this issue for multiple
> >> tegra platforms is to use Jack polling method for every 5 seconds.
> >> Also to make Jack detection work seamlessly the Jack worker thread
> >> needs to run continuously after HDA sound card registered
> >> irrespective of whether HDMI sink device connected or not, but the
> >> Jack state update call happens only when Codec is not powered on.
> >>
> >> Signed-off-by: Mohan Kumar <mkumard@nvidia.com>
> > Hmm, any reason not to use the standard jackpoll stuff that is already
> > implemented in HD-audio controller side?  That is, doesn't the
> > following oneliner work instead?
> The reason is, the Jack poll thread implemented in hda_codec.c runs
> only when HDACODEC is in runtime resume state. But the problem trying
> resolve here is something opposite, bcaz when hdacodec is in runtime
> resume state unsol event would work but not during suspend state. So
> either need to make some changes on hda_codec.c specific to tegra or
> make it on tegra specific driver. So I went with second option.

Well, the current behavior of jackpoll is intentional, so that it
avoids the unnecessary power up at the runtime PM suspend.  And your
requirement is rather opposite, and it's not Tegra-specific at all --
you just prefer the jack notification over the power saving.

So, implementing the feature in HD-audio core side would make more
sense (and it's simpler), something like below.

BTW, which codec needs this?  If it's about HDMI, doesn't the audio
component work?  At least nouveau has it, and I thought Nvidia binary
driver does poke the driver at hotplug by opening the proc file or
such.


Takashi

-- 8< --
--- a/include/sound/hda_codec.h
+++ b/include/sound/hda_codec.h
@@ -59,6 +59,7 @@ struct hda_bus {
 	unsigned int no_response_fallback:1; /* don't fallback at RIRB error */
 	unsigned int bus_probing :1;	/* during probing process */
 	unsigned int keep_power:1;	/* keep power up for notification */
+	unsigned int jackpoll_in_suspend:1; /* keep jack polling during runtime suspend */
 
 	int primary_dig_out_type;	/* primary digital out PCM type */
 	unsigned int mixer_assigned;	/* codec addr for mixer name */
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -2935,7 +2935,9 @@ static int hda_codec_runtime_suspend(struct device *dev)
 	if (!codec->card)
 		return 0;
 
-	cancel_delayed_work_sync(&codec->jackpoll_work);
+	if (!codec->bus->jackpoll_in_suspend &&
+	    dev->power.power_state != PMSG_ON)
+		cancel_delayed_work_sync(&codec->jackpoll_work);
 	state = hda_call_codec_suspend(codec);
 	if (codec->link_down_at_suspend ||
 	    (codec_has_clkstop(codec) && codec_has_epss(codec) &&
--- a/sound/pci/hda/hda_tegra.c
+++ b/sound/pci/hda/hda_tegra.c
@@ -421,6 +421,8 @@ static int hda_tegra_create(struct snd_card *card,
 	chip->driver_type = driver_caps & 0xff;
 	chip->dev_index = 0;
 	INIT_LIST_HEAD(&chip->pcm_list);
+	chip->jackpoll_interval = msecs_to_jiffies(5000);
+	chip->jackpoll_in_resume = 1;
 
 	chip->codec_probe_mask = -1;
 
