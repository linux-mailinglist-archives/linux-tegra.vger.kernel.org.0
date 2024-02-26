Return-Path: <linux-tegra+bounces-1034-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A91866C0E
	for <lists+linux-tegra@lfdr.de>; Mon, 26 Feb 2024 09:25:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 789971C20828
	for <lists+linux-tegra@lfdr.de>; Mon, 26 Feb 2024 08:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E4201CA81;
	Mon, 26 Feb 2024 08:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZD5/dibS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8d1vJ7Xi";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZD5/dibS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8d1vJ7Xi"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC3E1C6A3
	for <linux-tegra@vger.kernel.org>; Mon, 26 Feb 2024 08:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708935896; cv=none; b=SQLRATu5drxVOyRPLIfOD1fpXyEgRhbjUH8YnxmEOfFbI5uLjFbKM+oVKcdlUEcWNtP5GnofHnIHs8WXphtf80LL67FoLDEdX+4QrjdXC5/jZdg3QRmCCi3bWAj7FytQxhO4n0KFpm9ftLCJynqEVb53z1vK+qVEcKPk7mIt++M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708935896; c=relaxed/simple;
	bh=hO7YUUT567xWz5g/XtsoV7GKP1W4wgIsZwfHRWeYdPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bOOGJv4NuzUNB9mE4Rig6ckpHE2L0DcdWg/2e7+Fwqxxpl4jHi5TeasLQieTWGYECulRfxfRaTDrXAiZn3WEEMoLcoVH8hWwLYfJLgn9CyAyRvtV/QTGzLjF6tuDNqnnv5ERTtAQof3Ll3+Kn9NxcE7k9uTD5sDciF62aLR5ooI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZD5/dibS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8d1vJ7Xi; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZD5/dibS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8d1vJ7Xi; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 48A001FB3C;
	Mon, 26 Feb 2024 08:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708935893; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=gpzUCvEV4d4ejX0DHYYBoP281xYHhb/6CI72uYZVMSY=;
	b=ZD5/dibSSmoNmF+twA7JVDu6LAp9oYOaeh6TjSikcUHR3UP6eyhY6T7aqhcgHHhYCmSAF7
	mA4LB1da6HXFddZtPwHc/ctDMgTl8QkEXtQ++3KVbLERgOX9grfANZtw04psfmdSQPe7cy
	oEqCABnREZopsAu3bHjeOJn3E3eBTn8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708935893;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=gpzUCvEV4d4ejX0DHYYBoP281xYHhb/6CI72uYZVMSY=;
	b=8d1vJ7Xirg0I4ormgA4vEMjwztxoDsBtQwCj8gOafq43swoh1lwXmw2PqSIAJEpOWk1KAa
	mQtXjwIuHWYHdFBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708935893; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=gpzUCvEV4d4ejX0DHYYBoP281xYHhb/6CI72uYZVMSY=;
	b=ZD5/dibSSmoNmF+twA7JVDu6LAp9oYOaeh6TjSikcUHR3UP6eyhY6T7aqhcgHHhYCmSAF7
	mA4LB1da6HXFddZtPwHc/ctDMgTl8QkEXtQ++3KVbLERgOX9grfANZtw04psfmdSQPe7cy
	oEqCABnREZopsAu3bHjeOJn3E3eBTn8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708935893;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=gpzUCvEV4d4ejX0DHYYBoP281xYHhb/6CI72uYZVMSY=;
	b=8d1vJ7Xirg0I4ormgA4vEMjwztxoDsBtQwCj8gOafq43swoh1lwXmw2PqSIAJEpOWk1KAa
	mQtXjwIuHWYHdFBg==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 143E01329E;
	Mon, 26 Feb 2024 08:24:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id tp9NA9VK3GWwBgAAn2gu4w
	(envelope-from <tzimmermann@suse.de>); Mon, 26 Feb 2024 08:24:53 +0000
Message-ID: <a6e73f3f-9bd6-40c4-abfa-84a22de07c23@suse.de>
Date: Mon, 26 Feb 2024 09:24:52 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/tegra: Remove existing framebuffer only if we
 support display
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
References: <20240223150333.1401582-1-thierry.reding@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20240223150333.1401582-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="ZD5/dibS";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=8d1vJ7Xi
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.00 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
	 TO_DN_SOME(0.00)[];
	 RCPT_COUNT_FIVE(0.00)[6];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 FREEMAIL_TO(0.00)[gmail.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-3.00)[100.00%];
	 MID_RHS_MATCH_FROM(0.00)[];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[]
X-Spam-Score: -3.00
X-Rspamd-Queue-Id: 48A001FB3C
X-Spam-Flag: NO

Hi

Am 23.02.24 um 16:03 schrieb Thierry Reding:
> From: Thierry Reding <treding@nvidia.com>
>
> Tegra DRM doesn't support display on Tegra234 and later, so make sure
> not to remove any existing framebuffers in that case.
>
> v2: - add comments explaining how this situation can come about
>      - clear DRIVER_MODESET and DRIVER_ATOMIC feature bits
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Makes sense as far as the aperture helpers are concerned.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Best regards
Thomas

> ---
>   drivers/gpu/drm/tegra/drm.c | 23 ++++++++++++++++++++---
>   1 file changed, 20 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> index b1e1a78e30c6..2e1cfe6f6d74 100644
> --- a/drivers/gpu/drm/tegra/drm.c
> +++ b/drivers/gpu/drm/tegra/drm.c
> @@ -1220,9 +1220,26 @@ static int host1x_drm_probe(struct host1x_device *dev)
>   
>   	drm_mode_config_reset(drm);
>   
> -	err = drm_aperture_remove_framebuffers(&tegra_drm_driver);
> -	if (err < 0)
> -		goto hub;
> +	/*
> +	 * Only take over from a potential firmware framebuffer if any CRTCs
> +	 * have been registered. This must not be a fatal error because there
> +	 * are other accelerators that are exposed via this driver.
> +	 *
> +	 * Another case where this happens is on Tegra234 where the display
> +	 * hardware is no longer part of the host1x complex, so this driver
> +	 * will not expose any modesetting features.
> +	 */
> +	if (drm->mode_config.num_crtc > 0) {
> +		err = drm_aperture_remove_framebuffers(&tegra_drm_driver);
> +		if (err < 0)
> +			goto hub;
> +	} else {
> +		/*
> +		 * Indicate to userspace that this doesn't expose any display
> +		 * capabilities.
> +		 */
> +		drm->driver_features &= ~(DRIVER_MODESET | DRIVER_ATOMIC);
> +	}
>   
>   	err = drm_dev_register(drm, 0);
>   	if (err < 0)

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


