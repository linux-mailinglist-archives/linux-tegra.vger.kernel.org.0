Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E3431F558D
	for <lists+linux-tegra@lfdr.de>; Wed, 10 Jun 2020 15:16:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729215AbgFJNQS (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 10 Jun 2020 09:16:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728864AbgFJNQR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 10 Jun 2020 09:16:17 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D34AC03E96B
        for <linux-tegra@vger.kernel.org>; Wed, 10 Jun 2020 06:16:17 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id x27so1415410lfg.9
        for <linux-tegra@vger.kernel.org>; Wed, 10 Jun 2020 06:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OXsw15cR+ZyosRfP5eToOJ+Kwm4SVk27QffhyUka7K4=;
        b=dklUVQIg0cT3POJq7VrrAhoxRlIBa2SLaAudlZk3GM2eJlmoCjen9saRJxYNj0cAih
         qkpNPi9TdjjWYjgkRYNF1qXExXURZgzmJt7q1qid+R6s8NfOU/wV7jEBciopsf0RRb+P
         VPuz6a8feC10FRIAEMC/mPnPzKO00Lf3b/RV3yehxe5qEd0Dgo2SEk15IxalksGB3elW
         CAZbEP/AzFyfojJ/LxQmtWIlkf563ahMSvjB/RAtxuqmoASw0dTBVQgINEenaYWFiB36
         VmWIND4olOFaOtuODEtSN88BC6VIrwyUSOC93ESyXNBWEvO0VZgqrYNQfGkYM0nMH6QT
         LTdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OXsw15cR+ZyosRfP5eToOJ+Kwm4SVk27QffhyUka7K4=;
        b=d/dBwH1nWKRONsbHnlCpYSpf0g5BKsIpSBFItw70oqX7YHX+Gv5kzc7zdiM5TlngG/
         tlx5hGueL0jAIdJh/hdh75NGpR6zUsRZSzXG3FggxnhySSMo8H0BLReLT4Y5t6kj0fWX
         9NRklxkz8VgyisUNv/aES0u9HBxNTwjcqLVtwi1azFoFCXpaxpKQeQC+QVvFse+cGUwA
         EzkRdHa4n1JHFC73I2gMdC/uo8uzkwzvgKDfwdhpgggLOjPmcVExudwhBYyRoFN4rCLp
         0JLfKbOY+sbo0zmy4qGarW4vX0w+/X7idpQgONJzwepAzlIeRnQVFfceeYo7/mStNzPV
         hsYA==
X-Gm-Message-State: AOAM530oZDQtvl/JfVePKFGB3krZJbiSbVSKWtBPWgC3BBmierTU7lDH
        WZ037HytTOxj6sOcTs0VQWg=
X-Google-Smtp-Source: ABdhPJwAPrv2z4RRmB7XqNuKaIm0bk8kY6kw8F3Rh9nxZRK38Jk0ohshYLm/22qpCPoyJSAwGeImsw==
X-Received: by 2002:ac2:5cd1:: with SMTP id f17mr1631899lfq.4.1591794975611;
        Wed, 10 Jun 2020 06:16:15 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.googlemail.com with ESMTPSA id g12sm5001549ljl.33.2020.06.10.06.16.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2020 06:16:15 -0700 (PDT)
Subject: Re: [PATCH] drm/tegra: Add zpos property for cursor planes
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Jon Hunter <jonathanh@nvidia.com>
References: <20200610113059.2164132-1-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ca53d82f-1fd0-b2da-cfbf-7183a977e1d1@gmail.com>
Date:   Wed, 10 Jun 2020 16:16:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200610113059.2164132-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

10.06.2020 14:30, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> As of commit 4dc55525b095 ("drm: plane: Verify that no or all planes
> have a zpos property") a warning is emitted if there's a mix of planes
> with and without a zpos property.
> 
> On Tegra, cursor planes are always composited on top of all other
> planes, which is why they never had a zpos property attached to them.
> However, since the composition order is fixed, this is trivial to
> remedy by simply attaching an immutable zpos property to them.
> 
> Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---

What problem does it solve?

