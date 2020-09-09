Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F3D72623D8
	for <lists+linux-tegra@lfdr.de>; Wed,  9 Sep 2020 02:17:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728347AbgIIARA (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 8 Sep 2020 20:17:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726560AbgIIAQ6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 8 Sep 2020 20:16:58 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0E66C061573
        for <linux-tegra@vger.kernel.org>; Tue,  8 Sep 2020 17:16:57 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id a22so1145732ljp.13
        for <linux-tegra@vger.kernel.org>; Tue, 08 Sep 2020 17:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=aHaTSi7fSnGjwBOLQtAuiJEEe/fNGCKc8u+ZcHPxdgQ=;
        b=VM718ikC74EnEAa0HMMO5cWelvhb7XMsshvb+ff2pAt3J9JVEfx0E0CMgTDj5XKe8b
         q90oJr8RNeXDEm4sDX8LORWCSmbKOpQq1vKlVAmWUg7AAUJcSZ79fSddpkakPhU5HZzl
         PSeSbEo0rcY++RKYh1MSTyu3mjPeckkvLf4p0a0r8dgwrpN4qY8SqjUqCQazOaLqPfrr
         GwxgEKmbAQ/pkYid6l9VWOuNUjqhkxS+DZbjJV65tvgnROR+CKlsUw/J4H2no3wYiieh
         TlRTKeElG0wd1LICaDEBAoVbx6MxSrVdGV+lQhcWWZCAtkAgw2mCyZkDqsyvjGPmVegZ
         jE7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aHaTSi7fSnGjwBOLQtAuiJEEe/fNGCKc8u+ZcHPxdgQ=;
        b=SSsjDJpyY33DsEgSeh7e+6GP4WY9c3kyEX8ZNdhCyhl1ZYgz6ISlUjpsSd2YhTSDZ3
         7Mipu7nzFSC7grX7y4ochere3D5WHqW0SbB4mFZYBzZp2FhlIAAAXn0pnzqXIeE2UouQ
         SJUjuNaq3uudDi7bMH7J9MTPoG7lADsDI8QzjeNB4zgnGqnG0ehaaxt01X+PSJyxAoKK
         ltONDovmYefgbFSV67ioXBQZeVXKZhRCP9fTzWFIo9fr4HQPkPjj3qe220t8slZKD6qe
         uEmw7ksnSS6YlFz8SCGAnC3RKGgk8KafeOdCID8WzmWHeM+9R2zgTdne4ONHUj3YBPxS
         Errw==
X-Gm-Message-State: AOAM5312MIO18Y8MYme8LkwjGh3PNYA816eMuPrJ08uXGjcqGC0ADF4I
        4YfYrFAseM5qFuTGScjb95s=
X-Google-Smtp-Source: ABdhPJxMOArydBWMtC63OEwp6cR1nWEkqOX8GOpDv1Sq+yxTNcb+69met/SHeMsuzTx1FZ+aBWIYEg==
X-Received: by 2002:a05:651c:1352:: with SMTP id j18mr459685ljb.343.1599610616363;
        Tue, 08 Sep 2020 17:16:56 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id e17sm303594ljg.85.2020.09.08.17.16.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2020 17:16:55 -0700 (PDT)
Subject: Re: [RFC PATCH v2 15/17] drm/tegra: Add power_on/power_off engine
 callbacks
To:     Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-16-mperttunen@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <2ddaf2ef-e232-7d44-0b08-e190f20297b2@gmail.com>
Date:   Wed, 9 Sep 2020 03:16:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200905103420.3021852-16-mperttunen@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

05.09.2020 13:34, Mikko Perttunen пишет:
...
> +static int vic_power_on(struct tegra_drm_client *client)
> +{
> +	struct vic *vic = to_vic(client);
> +
> +	return pm_runtime_get_sync(vic->dev);

Please keep in mind that RPM needs to be put in a case of error.

Maybe it would be better if driver-core could take care of
resuming/suspending client's RPM instead of putting that burden on each
client individually?
