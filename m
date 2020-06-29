Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 792C120D7DC
	for <lists+linux-tegra@lfdr.de>; Mon, 29 Jun 2020 22:08:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733264AbgF2Td1 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 29 Jun 2020 15:33:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733260AbgF2Td0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Jun 2020 15:33:26 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F7EDC03E979
        for <linux-tegra@vger.kernel.org>; Mon, 29 Jun 2020 12:33:26 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id k15so9829505lfc.4
        for <linux-tegra@vger.kernel.org>; Mon, 29 Jun 2020 12:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fijArdkg3PluTiSpvPbRCQSTn0uwHiGsyvlvdEoKWZU=;
        b=ZOxDYNTX58fJ5orIul3Zgn9tpUCxUBsH7Zvp/h9xKXFwp8XS2qhZ6GL39Ydbq7tfdX
         V2aXtycfU4eyf/J/JhqhFESsfmZOhIRfj8/IZcpLvSHbH2XtsyPWxFAAq6sKERYFCJ2T
         Bcp0KGASHZ3NGZLW3EV+liwxhwDcvr1pQGrQJe4Bl+cZq+FhteWGEOZpNs4gqHgsc/mQ
         alnV5GQoWk0KiHgWHpx8aqfch8jYWC8Prs1qyYwTfIGkncY8rUBgePkZCNp9zA7JBDfU
         etfS3ZIbLhpP6pZYdE2epgupKJQvuBRhTFHLxLJpittZEnrjjIHOuRODDZ/axlgTHX1G
         wMHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fijArdkg3PluTiSpvPbRCQSTn0uwHiGsyvlvdEoKWZU=;
        b=hm7PzdvkVVyy9k2dCBQjtwmzKlPf+2TUX1RAV5L5XhTzspo9YR8Rlk/vSRUTrUWRcN
         zyTatDfy9XzKy+CPLPoFJA98haF369x7ZSM7853aibjVkFBhaQdPWcgtwfNt7PvBBDai
         AX/mxe8LJq68LoxArOzpIOCHT85ptKPPr9cQdV9aVtW/RTAdGhSRr8ebXjdaKh1B5pnN
         JQlFqA6CIsUxHr76rgB7hEpLj61qkoCyPqZ9s0W1KgFy2lg0MZhrJn6o3v9sNizxUapd
         tBGyIZo3WXs4bYszK2hjVkvbB+sw8+tG0tvuBg50jTiYfHj29hbt+M3Q/JA/1v0IdQhP
         qBcw==
X-Gm-Message-State: AOAM5308R2IpF7g+1AxV8qrbZgcsdD32V6dY+F5D4ryH2l7xLhRM3zQX
        kDy3WBF6Ah6ts2yBhwwODhA=
X-Google-Smtp-Source: ABdhPJzu/VnkbGp2Xl09zjpTeaH0MKr8NGdzTKMOdCxZmHgDGU29lu5QoYD5cZPN/PjYm/BYNgZz1w==
X-Received: by 2002:a19:4209:: with SMTP id p9mr10172897lfa.198.1593459204904;
        Mon, 29 Jun 2020 12:33:24 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.googlemail.com with ESMTPSA id w4sm156488ljw.16.2020.06.29.12.33.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2020 12:33:24 -0700 (PDT)
Subject: Re: [RFC] Host1x/TegraDRM UAPI (sync points)
To:     Mikko Perttunen <cyndis@kapsi.fi>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, sumit.semwal@linaro.org,
        gustavo@padovan.org
Cc:     "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>, talho@nvidia.com,
        bhuntsman@nvidia.com, Erik Faye-Lund <kusmabite@gmail.com>
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
 <5b1edaad-ba36-7b0f-5b02-457ae5b6d91e@gmail.com>
 <62859775-514c-2941-75ed-6905e9282a6f@kapsi.fi>
 <623c1eaa-31fb-8dff-f6c0-d8cd0be60070@gmail.com>
 <827c92a6-7fed-a81c-ba8e-6c69416c4ab9@kapsi.fi>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <8e78c18a-59da-a72f-e04a-ef6c23a49830@gmail.com>
Date:   Mon, 29 Jun 2020 22:33:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <827c92a6-7fed-a81c-ba8e-6c69416c4ab9@kapsi.fi>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

29.06.2020 13:27, Mikko Perttunen пишет:
...
>>>> 3. Sync points should be properly refcounted. Job's sync points
>>>> shouldn't be re-used while job is alive.
>>>>
>>>> 4. The job's sync point can't be re-used after job's submission (UAPI
>>>> constraint!). Userspace must free sync point and allocate a new one for
>>>> the next job submission. And now we:
>>>>
>>>>     - Know that job's sync point is always in a healthy state!
>>>>
>>>>     - We're not limited by a number of physically available hardware
>>>> sync
>>>> points! Allocation should block until free sync point is available.

It also occurred to me that if allocation is blocking and if there is a
need to allocate multiple sync points for a job, then the IOCTL should
be able to allocate multiple sync points at once. This will prevent
interlock situation where two context could block on each other.
