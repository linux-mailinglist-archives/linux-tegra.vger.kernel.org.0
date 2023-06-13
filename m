Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C63D72DE55
	for <lists+linux-tegra@lfdr.de>; Tue, 13 Jun 2023 11:55:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240129AbjFMJzg (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 13 Jun 2023 05:55:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241934AbjFMJzY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 13 Jun 2023 05:55:24 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AED6590
        for <linux-tegra@vger.kernel.org>; Tue, 13 Jun 2023 02:55:18 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 69EA81FD6D;
        Tue, 13 Jun 2023 09:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1686650117; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=P265Uv6CcvavmFR5gq/Gw0Drohun0A3BXfzFYfOVCjk=;
        b=Mv/vVjRTUYdmUgz4jK2/qs07f2XV91aV9ZgTpFL6ExMcWzsCOtCR2JbwR2U2Iy23moqcKG
        X/of1TalAJHkt72TBvolS67yyXUdpWwFP3FWiT9DEIdP1dHCQRbXsCPWvyOaN5Egls6IKk
        ZaQ3fncZaBX7/q2E6sPH6SL5zfXPQQw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1686650117;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=P265Uv6CcvavmFR5gq/Gw0Drohun0A3BXfzFYfOVCjk=;
        b=DY+yVkmYUjd9A5eaevhIWViGx4qzSfwb9m2rqdAiEobI3Zm7emi0inBNNvdYoPDgLmK6Jp
        sWaG0xrxLrG3/JBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2FECC13345;
        Tue, 13 Jun 2023 09:55:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id LcSkCgU9iGS+YgAAMHmgww
        (envelope-from <tiwai@suse.de>); Tue, 13 Jun 2023 09:55:17 +0000
Date:   Tue, 13 Jun 2023 11:55:16 +0200
Message-ID: <87mt13elff.wl-tiwai@suse.de>
From:   Takashi Iwai <tiwai@suse.de>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        "Thierry Reding" <thierry.reding@gmail.com>,
        Sameer Pujar <spujar@nvidia.com>,
        <alsa-devel@alsa-project.org>, <linux-tegra@vger.kernel.org>,
        "Oswald Buddenhagen" <oswald.buddenhagen@gmx.de>
Subject: Re: [PATCH] ASoC: tegra: Fix Master Volume Control
In-Reply-To: <20230613093453.13927-1-jonathanh@nvidia.com>
References: <20230613093453.13927-1-jonathanh@nvidia.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,T_SPF_HELO_TEMPERROR,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 13 Jun 2023 11:34:53 +0200,
Jon Hunter wrote:
> 
> Commit 3ed2b549b39f ("ALSA: pcm: fix wait_time calculations") corrected
> the PCM wait_time calculations and in doing so reduced the calculated
> wait_time. This exposed an issue with the Tegra Master Volume Control
> (MVC) device where the reduced wait_time caused the MVC to fail. For now
> fix this by setting the default wait_time for Tegra to be 500ms.
> 
> Fixes: 3ed2b549b39f ("ALSA: pcm: fix wait_time calculations")
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>

Hm, it's still not clear why it fails.  The commit above changes the
timeout of wait_for_avail() to the full-buffer + 10% margin.  In
thoery, the loop should abort after the full buffer read, and that
must be enough.  If there were a large FIFO behind, it might be
overflow, but the fifo_size of Tegra driver seems 4, so it's
negligible.

If extending the timeout "fixes" the problem, it might indicate that
the period update IRQ is triggered too late.  Could you measure the
timing of each snd_pcm_period_elapsed() and wait_for_avail() call?


thanks,

Takashi


> ---
>  sound/soc/tegra/tegra_pcm.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/sound/soc/tegra/tegra_pcm.c b/sound/soc/tegra/tegra_pcm.c
> index 468c8e77de21..0b69cebc9a33 100644
> --- a/sound/soc/tegra/tegra_pcm.c
> +++ b/sound/soc/tegra/tegra_pcm.c
> @@ -117,6 +117,9 @@ int tegra_pcm_open(struct snd_soc_component *component,
>  		return ret;
>  	}
>  
> +	/* Set wait time to 500ms by default */
> +	substream->wait_time = 500;
> +
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(tegra_pcm_open);
> -- 
> 2.34.1
> 
