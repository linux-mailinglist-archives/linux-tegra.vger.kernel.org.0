Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2BB31ACEB7
	for <lists+linux-tegra@lfdr.de>; Thu, 16 Apr 2020 19:31:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727779AbgDPRa2 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 16 Apr 2020 13:30:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726207AbgDPRa1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 16 Apr 2020 13:30:27 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7161EC061A0C
        for <linux-tegra@vger.kernel.org>; Thu, 16 Apr 2020 10:30:27 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id m8so8758317lji.1
        for <linux-tegra@vger.kernel.org>; Thu, 16 Apr 2020 10:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PzXYo6swgx9ErVWXLPhxkfiU9vzkaSg3H3Qei59zPVk=;
        b=EMKTHWrZe1g6E1jAx3Mm6n4rNEbgdAY2tazlr947do0XAmQrCx7fqdG7Y/NQ7ZvIGa
         +Vr2LStXg+i/M68mtRtC7AGVSWpk0b8ZZXgW7BQQefZb38i6cKZqmBLA5gzPrXhzgUGd
         9Ljsx+ARG6EHoZhu+sblmtC8ZIZvW7Vh+P11bc3+R7eS+1ZkJbAmloYpBj0ocpIg188O
         qRxHoayqIWP6gQ9nmQLxRXXzgb9Ff9O3gBoMs0KUwIwUSu+7MncsrUXKf3caQ02xkaCz
         9nyD32+f+p8xtfm3+H0VnrbT+0WAHkMyi+/6XhdOL+/RtVEYM+i63Nr2V9ns56qfe9XI
         wqiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PzXYo6swgx9ErVWXLPhxkfiU9vzkaSg3H3Qei59zPVk=;
        b=SWqNyxB1ZHLjq/ATUISrXjgHqFro90kRdJR247FyHIVTdWEG66FeKz9q3ocqD/Dmvi
         tz1c+OxERCvLwtxD5IGQDEif/kbvJIrxGVbk3TXZaBavjZJonyd0UCQ099baOQnLS2q9
         5vZvXVzqtDHnci24tOzww3Y3Hak7ai9tIpQz/KcgmUYgKW1buXP1imetuyUnCqNyfYOi
         5VpIhTpWocsox1n4cM/54r0Ze42gwv+ggAHv/DKLvRK14n2vt9gk8yJz6jf94WWo1C/g
         AvcIMHap0L4XMP8AmIVH/Sz2CbMxEIu1oRDINdf5UMDrx9aIBtucypKvoe6eT6FTFiLo
         j7eQ==
X-Gm-Message-State: AGi0PuYbqVDiYX449PxnQqTA+6O/lBNtNSxPthB6qTeK6puSd4v3blPH
        NEa0WlzxmVQU59Wk1AALhkWwlYb5
X-Google-Smtp-Source: APiQypKtQyEgNh58ni0ovy2jVpR3dc7TEccd1Z071GjbZqt59NIctX8jyj1HZRyg/Uuy9PaODkOlWw==
X-Received: by 2002:a2e:9a54:: with SMTP id k20mr7012405ljj.272.1587058225547;
        Thu, 16 Apr 2020 10:30:25 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id u19sm12879858lji.61.2020.04.16.10.30.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2020 10:30:24 -0700 (PDT)
Subject: Re: [PATCH v3 1/2] drm/tegra: output: Don't leak OF node on error
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20200416172405.5051-1-digetx@gmail.com>
 <20200416172405.5051-2-digetx@gmail.com>
 <20200416172727.GN4796@pendragon.ideasonboard.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <304a2a58-0031-bf88-6290-e72ab025d8c5@gmail.com>
Date:   Thu, 16 Apr 2020 20:30:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200416172727.GN4796@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

16.04.2020 20:27, Laurent Pinchart пишет:
> Hi Dmitry,
> 
> Thank you for the patch.
> 
> On Thu, Apr 16, 2020 at 08:24:04PM +0300, Dmitry Osipenko wrote:
>> The OF node should be put before returning error in tegra_output_probe(),
>> otherwise node's refcount will be leaked.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Hello Laurent,

That is the fastest kernel review I ever got, thank you :)
